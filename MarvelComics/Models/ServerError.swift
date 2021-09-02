//
//  ServerError.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 01/09/21.
//


import Foundation

struct ServerError: Decodable {
    let status: String?
    let error: String?
}
