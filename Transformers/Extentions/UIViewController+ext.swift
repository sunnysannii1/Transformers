//
//  UIViewController+ext.swift
//  Transformers
//
//  Created by Ahsan Ali on 28/04/2021.
//

import UIKit
// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension NSObject {
    var className: String {
            return NSStringFromClass(self as! AnyClass).components(separatedBy: ".").last ?? ""
        }

        public class var className: String {
            return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
        }
}
extension Encodable {

    var dict : [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else { return nil }
        return json
    }
}

extension String {
    
    var intValue:Int {
        return Int(self) ?? 0
    }
}
