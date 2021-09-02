//
//  UIViewExtension.swift
//  MarvelComics
//
//  Created by SYED FARAN GHANI on 01/09/21.
//


import Foundation
import UIKit
import ProgressHUD

extension UIView {
    func showLoader(show: Bool, text: String = .kLoading) {
        if show {
            
            ProgressHUD.show(.kLoading)
            
        } else {

            ProgressHUD.dismiss()
        }
    }
}
