//
//  AddTransformerViewModel.swift
//  Transformers
//
//  Created by Ahsan Ali on 28/04/2021.
//

import UIKit

class AddTransformerViewModel: BaseViewModel {

    
    // MARK: - Cycles

    init(bot:Transformer,isUpdate:Bool? = false){
        super.init()
        proxy = NetworkProxy()
        proxy.delegate = self
        proxy.requestForAddTransformer(item: bot,isUpdate:isUpdate!)
        
    }
   
    
    
    // MARK: - Network
    override func requestDidFinishedWithData(Data: Any, reqType: RequestType) {
        super.requestDidFinishedWithData(Data: Data, reqType: reqType)
        if let i = Data as? (Result <Transformer, Error>){
        consoleLog(i)
            bindViewModelToController()
        }
        
        
    }
    
    override func requestDidFailedWithError(Error: String, reqType: RequestType) {
        super.requestDidFailedWithError(Error: Error, reqType: reqType)
    }
    
    
}

