//
//  ComicsViewModel.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 01/09/21.
//

import Foundation

class ComicsViewModel {
    
    private var httpClient: HTTPClient!
    
//    let title = NSLocalizedString("CurrencyConverter", comment: "")
//    let groupBarButtonTitle = NSLocalizedString("Groups", comment: "")
    
    var isBusy: Bindable<Bool> = Bindable(false)
    var comicList: Bindable<[Comic]?> = Bindable(nil)
    var error: Bindable<CTError?> = Bindable(nil)
    
    init(client: HTTPClient? = nil) {
        self.httpClient = client ?? HTTPClient.shared
    }
    
    func getComics(id: String, completion:  @escaping ([Comic]) -> Void) {
        isBusy.value = true
                
        let url = URL(string: .kBaseUrl + "characters/\(id)/\(String.kComicsEndpoint)")!
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = [
            URLQueryItem(name: "apikey", value: .kAPIKey),
            URLQueryItem(name: "hash", value: .kTSMD5Hash),
            URLQueryItem(name: "ts", value: .kTSString)
        ]
        
        httpClient.dataTask(components!.url!) { [weak self] (result) in
            guard let self = self else {
                return
            }
            
            self.isBusy.value = false
            switch result {
            case .success(let data):
                guard let data = data else {
                    return
                }
                
                do {
                    let jsonResult = try JSONDecoder().decode(Comics.self, from: data)
                    self.comicList.value = jsonResult.data.results
                    Log.info("comics list fetch successfull.")
                    completion(self.comicList.value!)
                } catch {
                    Log.error("Unable to decode", error: error)
                }
            case .failure(let error):
                self.error.value = CTError(error.localizedDescription)
                Log.error("Error", error: error)
            }
        }
    }
}
