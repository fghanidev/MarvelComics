//
//  Comics.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 03/09/21.
//

import Foundation

struct Comics: Decodable {
    var data: ComicResults
}

struct ComicResults: Decodable {
    var results: [Comic]
}
