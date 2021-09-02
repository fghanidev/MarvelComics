//
//  UIImageViewExtension.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 01/09/21.
//


import Foundation
import UIKit

extension UIImageView {
    func makeCircle() {
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
    }
}
