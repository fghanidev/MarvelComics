//
//  Conversion.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 01/09/21.
//


import Foundation


public class Comic: Codable {
    public var title: String?
    public var description: String?
    public var thumbnail: Dictionary<String, Any>?
    public var characters: Dictionary<String, Any>?

    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case thumbnail = "thumbnail"
        case characters = "creators"

    }
   
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let title = try container.decodeIfPresent(String.self, forKey: .title)
        let description = try container.decodeIfPresent(String.self, forKey: .description)
        let thumbnail = try container.decodeIfPresent(Dictionary<String, Any>.self, forKey: .thumbnail)
        let characters = try container.decodeIfPresent(Dictionary<String, Any>.self, forKey: .characters)

        
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
        self.characters = characters

    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(title, forKey: .title)
//        try container.encode(description, forKey: .description)
//        try container.encode(thumbnail, forKey: .thumbnail)
//        try container.encode(characters, forKey: .characters)
    }
}
