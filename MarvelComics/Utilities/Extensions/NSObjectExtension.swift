//
//  NSObjectExtension.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 01/09/21.
//


import Foundation

extension NSObject {
    class var name: String {
        return String(describing: self)
    }
}
