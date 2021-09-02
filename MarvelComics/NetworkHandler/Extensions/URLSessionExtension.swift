//
//  URLSessionExtension.swift
//  CurrencyConverter
//
//  Created by SYED FARAN GHANI on 17/07/21.
//


import Foundation

extension URLSession: URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        let task = dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask
        return task as URLSessionDataTaskProtocol
    }
}
