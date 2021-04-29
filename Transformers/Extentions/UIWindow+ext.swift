//
//  UIView+ext.swift
//  Transformers
//
//  Created by Ahsan Ali on 28/04/2021.
//

import UIKit
extension UIWindow {

  static var currentController: UIViewController? {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    return appDelegate?.window?.currentController
}

var currentController: UIViewController? {
    if let vc = self.rootViewController {
        return topViewController(controller: vc)
    }
    return nil
}
    func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nc = controller as? UINavigationController {
            if nc.viewControllers.count > 0 {
                return topViewController(controller: nc.viewControllers.last!)
            } else {
                return nc
            }
        }
        
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
