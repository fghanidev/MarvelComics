//
//  CTError.swift
//  CurrencyConverter
//
//  Created by SYED FARAN GHANI on 17/07/21.
//


import Foundation

typealias CTErrorHandler = (CTError?) -> Void

struct CTError: Error {
    var localizedDescription: String
    init(_ localizedDescription: String) {
        self.localizedDescription = localizedDescription
    }
}
