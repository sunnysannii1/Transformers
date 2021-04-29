//
//  BaseViewModel.swift
//  Transformers
//
//  Created by Ahsan Ali on 28/04/2021.
//

import Foundation
class BaseViewModel: NSObject,NetworkProxyDelegate {
    // MARK: -  Vars
    var bindViewModelToController : (() -> ()) = {}
    var bindErrorViewModelToController : ((String) -> ()) = {_ in }
    var proxy : NetworkProxy!
   
    
    
    // MARK: -  Network
    func requestDidBegin() {
        appUtil.shared.showLoader()
    }
    
    func requestDidFinishedWithData(Data: Any, reqType: RequestType) {
        appUtil.shared.hideLoader()
        if let res = Data as? String ,reqType != .getToken{
            appUtil.shared.showAlert(message: res)
        }
    }
    
    func requestDidFailedWithError(Error: String, reqType: RequestType) {
        appUtil.shared.hideLoader()
        appUtil.shared.showAlert(message: Error)
    }
    
}
