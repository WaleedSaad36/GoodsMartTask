//
//  UIView+LoadingIndecator.swift
//  GoodsMartTask
//
//  Created by mohamed eltabey on 5/31/22.
//

import Foundation
import UIKit
import NVActivityIndicatorView
extension UIView {
    private func setupActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = self.bounds
        activityIndicator.center = self.center
        activityIndicator.style = .gray
        activityIndicator.tag = 333
        return activityIndicator
    }
    
    func showLoading() {
        let activityIndicator = setupActivityIndicator()
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
    }
    
    func hideLoading() {
        if let activityIndicator = viewWithTag(333){
            activityIndicator.removeFromSuperview()
        }
    }
    
    
}
