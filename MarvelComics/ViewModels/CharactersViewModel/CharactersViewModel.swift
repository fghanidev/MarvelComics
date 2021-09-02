//
//  CharactersViewModel.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 03/09/21.
//

import Foundation

class CharactersViewModel {
    
    private var httpClient: HTTPClient!
    
    var isBusy: Bindable<Bool> = Bindable(false)
    var characterList: Bindable<[Character]?> = Bindable(nil)
    var error: Bindable<CTError?> = Bindable(nil)
    
    init(client: HTTPClient? = nil) {
        self.httpClient = client ?? HTTPClient.shared
    }
    
    func getCharacters(completion:  @escaping ([Character]) -> Void) {
        isBusy.value = true
                
        let url = URL(string: .kBaseUrl + .kCharacterEndpoint)!
        
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
                    let jsonResult = try JSONDecoder().decode(Characters.self, from: data)
                    self.characterList.value = jsonResult.data.results
                    Log.info("characters list fetch successfull.")
                    completion(self.characterList.value!)
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
