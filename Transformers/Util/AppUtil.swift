//
//  AppUtil.swift
//  Transformers
//
//  Created by Ahsan Ali on 28/04/2021.
//

import Foundation
import NVActivityIndicatorView
class appUtil: NSObject {
    // MARK: - Vars
    static  let shared = appUtil()
    private var indicator:NVActivityIndicatorView?
    private var container:UIView?
    // MARK: - Cycles
    private override init() {}
    
    // MARK: - Helpers
    //showing loader for api calls
    func showLoader(){
        if  indicator == nil {
            DispatchQueue.main.async {
                self.indicator = NVActivityIndicatorView(frame: CGRect(x: ((UIWindow.currentController?.view.bounds.midX)! - 25), y: (UIWindow.currentController?.view.bounds.midY)! - 25, width: 50, height: 50),type: .ballRotateChase,color: .black)
                self.indicator?.startAnimating()
                let window = UIApplication.shared.delegate!.window!
                self.container = UIView(frame: window!.bounds)
                self.container!.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 0)
                self.container!.addSubview(self.indicator!)
                window!.addSubview(self.container!)
            }
        }
    }
    // hide loader after api calls
    func hideLoader(){
       DispatchQueue.main.async {
            self.indicator?.stopAnimating()
            self.indicator = nil
            self.indicator?.removeFromSuperview()
            self.container?.removeFromSuperview()
            self.container = nil
        }
    }
    //show alert to user
    func showAlert(message:String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIWindow.currentController?.present(alert, animated: true, completion: nil)
    }
    
    
}
