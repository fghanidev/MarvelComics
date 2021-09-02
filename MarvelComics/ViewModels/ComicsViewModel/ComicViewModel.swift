//
//  ComicViewModel.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 03/09/21.
//

import Foundation


class ComicViewModel{
    private let comic: Comic!
    
    let title: String
    let description: String
    let thumbnail: Dictionary<String, Any>
    let characters: Dictionary<String, Any>

    init(comic: Comic) {
        self.comic = comic
        
        title = comic.title ?? ""
        description = comic.description ?? ""
        thumbnail = comic.thumbnail ?? [:]
        characters = comic.characters ?? [:]

    }
}
