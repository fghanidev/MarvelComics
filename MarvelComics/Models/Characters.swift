//
//  Characters.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 03/09/21.
//

import Foundation

struct Characters: Decodable {
    var data: CharacterResults
}

struct CharacterResults: Decodable {
    var results: [Character]
}
