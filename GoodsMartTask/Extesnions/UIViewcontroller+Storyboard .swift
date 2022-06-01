//
//  UIViewcontroller+Storyboard .swift
//  GoodsMartTask
//
//  Created by mohamed eltabey on 5/31/22.
//

import Foundation
import UIKit

extension UIViewController {
    class func create<T: UIViewController>(storyboardName: String, identifier: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
