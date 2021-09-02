//
//  Character.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 03/09/21.
//

import Foundation


public class Character: Codable {
    public var id: Int?
    public var name: String?
    public var description: String?
    public var thumbnail: Dictionary<String, Any>?

    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case thumbnail = "thumbnail"
     
    }
   
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decodeIfPresent(Int.self, forKey: .id)
        let name = try container.decodeIfPresent(String.self, forKey: .name)
        let description = try container.decodeIfPresent(String.self, forKey: .description)
        let thumbnail = try container.decodeIfPresent(Dictionary<String, Any>.self, forKey: .thumbnail)

        
        self.id = id
        self.name = name
        self.description = description
        self.thumbnail = thumbnail

    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(title, forKey: .title)
//        try container.encode(description, forKey: .description)
//        try container.encode(thumbnail, forKey: .thumbnail)
//        try container.encode(characters, forKey: .characters)
    }
}
