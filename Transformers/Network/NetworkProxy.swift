//
//  NetworkProxy.swift
//  stockly
//
//  Created by Ahsan Ali on 31/03/2021.
//

import Foundation
import UIKit
import Alamofire
 protocol NetworkProxyDelegate:class {
    
    func requestDidBegin()
    func requestDidFinishedWithData(Data:Any,reqType:RequestType)
    func requestDidFailedWithError(Error:String,reqType:RequestType)
    
}

class NetworkProxy:NSObject ,ServiceManagerDelegate {
   
    weak var delegate:NetworkProxyDelegate?  = nil
    var serviceManager:ServiceManager?
    var requestParser:RequestParser?
   
    
    
    override init() {
        super.init()
        serviceManager = ServiceManager()
        requestParser = RequestParser()
        serviceManager?.delegate = self
    }
    
    //MARK:- Rest Api's
    func requestForSpark(){
        delegate?.requestDidBegin()
        serviceManager?.RestApi(postPath: EndPoint.getToken, reqType: .getToken, method: .get)
    }
    
    func requestForGetTransformers(){
        delegate?.requestDidBegin()
        serviceManager?.RestApi(postPath: EndPoint.transformers, reqType: .transformers, method: .get)
    }
        
    func requestForAddTransformer(item:Transformer,isUpdate:Bool){
        delegate?.requestDidBegin()
        
        let param = item.dict
        let method = isUpdate ? HTTPMethod.put : HTTPMethod.post
        serviceManager?.RestApi(postPath: EndPoint.transformers,parameters: param, reqType: .Addtransformer, method: method)
    }
    
    func requestForRemoveTransformer(id:String){
        delegate?.requestDidBegin()
        let param = ["transformerId":id]
        serviceManager?.RestApi(postPath: EndPoint.transformers,parameters: param, reqType: .Addtransformer, method: .delete)
    }
    
    //MARK:- Service Manager Delegate
   func requestFinished(responseData: Any, reqType: RequestType) {
    let response = requestParser?.parseResponse(response: responseData as! Data, reqType: reqType)
        delegate?.requestDidFinishedWithData(Data: response as Any, reqType: reqType)
    }
      
    func requestFailed(Data: Any?, Error: String?, reqType: RequestType) {
        delegate?.requestDidFailedWithError(Error: Error!, reqType: reqType)
    }
    
   
    
    
    
}
