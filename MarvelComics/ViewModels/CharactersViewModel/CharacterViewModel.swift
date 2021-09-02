//
//  CharacterViewModel.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 03/09/21.
//

import Foundation

class CharacterViewModel {
    private let character: Character!
    
    let id: Int
    let name: String
    let description: String
    let thumbnail: Dictionary<String, Any>
    
    init(character: Character) {
        self.character = character
        
        id = character.id ?? 0
        name = character.name ?? ""
        description = character.description ?? ""
        thumbnail = character.thumbnail ?? [:]
    }
}
