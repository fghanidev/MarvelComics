//
//  RequestProtocol.swift
//  CurrencyConverter
//
//  Created by SYED FARAN GHANI on 17/07/21.
//


import Foundation

public typealias HTTPHeaders = [String: String]

protocol RequestProtocol {
    var baseURL: URL { get }
    var path: String { get }
}
