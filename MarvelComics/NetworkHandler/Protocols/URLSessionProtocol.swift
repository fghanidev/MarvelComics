//
//  URLSessionProtocol.swift
//  CurrencyConverter
//
//  Created by SYED FARAN GHANI on 17/07/21.
//


import Foundation

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}
