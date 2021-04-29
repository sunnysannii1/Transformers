//
//  TransformerListViewModel.swift
//  Transformers
//
//  Created by Ahsan Ali on 29/04/2021.
//

import UIKit

class TransformerListViewModel: BaseViewModel {

    var bindViewTransformersToController : (([Transformer]) -> ()) = {_ in }
    //MARK:- Cycles
    override init() {
        super.init()
        proxy = NetworkProxy()
        proxy.delegate = self
    }
    
    func getList(){
        proxy.requestForGetTransformers()
    }
    
    func remove(id:String){
        proxy.requestForRemoveTransformer(id: id)
    }
    
    
    //MARK:- Network
    override func requestDidBegin() {
        super.requestDidBegin()
    }
    
    override func requestDidFinishedWithData(Data: Any, reqType: RequestType) {
        super.requestDidFinishedWithData(Data: Data, reqType: reqType)
       
        switch reqType {
        case .deleteTransformer:
            if let res = Data as? String{
                bindViewModelToController()
                appUtil.shared.showAlert(message: res)
            }
        default:
            if let result = Data as? (Result <TransformsItems, Error>) {
                switch result {
                case .success(let value):
                    consoleLog(value)
                    bindViewTransformersToController(value.transformers ?? [])
                    if value.transformers?.count == 0 {
                        appUtil.shared.showAlert(message: "No Data Found!")
                    }
                default:
                    break
                }
            }
        }
        
        
        
    }
    
    override func requestDidFailedWithError(Error: String, reqType: RequestType) {
        super.requestDidFailedWithError(Error: Error, reqType: reqType)
    }
    
    
    
}
