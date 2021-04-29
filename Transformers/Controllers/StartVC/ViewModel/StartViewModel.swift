//
//  StartViewModel.swift
//  Transformers
//
//  Created by Ahsan Ali on 29/04/2021.
//

import UIKit

class StartViewModel: BaseViewModel {

    // MARK: - Cycles
    override init() {
        super.init()
        proxy = NetworkProxy()
        proxy.delegate = self
        proxy.requestForSpark()
    }
    
    
    
    // MARK: - Network
    override func requestDidFinishedWithData(Data: Any, reqType: RequestType) {
        super.requestDidFinishedWithData(Data: Data, reqType: reqType)
        if let token = Data as? String {
            USER.shared.setToken(token)
            bindViewModelToController()
        }
        
        
    }
    
    
    
}
