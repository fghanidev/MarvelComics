//
//  NetworkManager.swift
//  CurrencyConverter
//
//  Created by SYED FARAN GHANI on 17/07/21.
//


import Foundation

class HTTPClient {
    // MARK: Typealias
    typealias CompletionResult = (Result<Data?, CTError>) -> Void
    
    // MARK: - Shared Instance
    static let shared = HTTPClient(session: URLSession.shared)
    
    // MARK: - Private Properties
    private let session: URLSessionProtocol
    private var task: URLSessionDataTaskProtocol?
    private var completionResult: CompletionResult?

    // MARK: - Initialiser
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    // MARK: - Data Task Helper
    func dataTask(_ url: URL, completion: @escaping CompletionResult) {
        completionResult = completion
        var urlRequest = URLRequest(url: url,
                                    cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                    timeoutInterval: 60.0)
        urlRequest.httpMethod = "GET"
        
        task = session.dataTask(with: urlRequest) { (data, response, error) in
            //return error if there is any error in making request
            if let error = error {
                self.completionResult(.failure(CTError(error.localizedDescription)))
                return
            }
            
            //check response
            if let response = response, response.isSuccess {
                if let data = data {
                    self.completionResult(.success(data))
                }
                
                if response.httpStatusCode == 204 {
                    self.completionResult(.success(nil))
                }
            } else {
                let commonErrorMessage = NSLocalizedString("Somthing went wrong!", comment: "")
                guard let data = data else {
                    Log.error(commonErrorMessage)
                    self.completionResult(.failure(CTError(commonErrorMessage)))
                    return
                }
                do {
                    let serverError = try JSONDecoder().decode(ServerError.self, from: data)
                    Log.error(serverError.error ?? commonErrorMessage)
                    self.completionResult(.failure(CTError(serverError.error ?? commonErrorMessage)))
                } catch {
                    Log.error(commonErrorMessage, error: error)
                    self.completionResult(.failure(CTError(commonErrorMessage)))
                }
            }
        }
        
        //Resume task
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    // MARK: - Private Helper Function
    private func completionResult(_ result: Result<Data?, CTError>) {
        DispatchQueue.main.async {
            self.completionResult?(result)
        }
    }
}
