//
//  ServiceManager.swift
//  Transformers
//
//  Created by Ahsan Ali on 28/04/2021.
//

import Foundation
import Alamofire
protocol ServiceManagerDelegate:class {
    func requestFinished(responseData: Any,reqType:RequestType)
    func requestFailed(Data:Any?,Error:String?,reqType:RequestType)
   
}


class ServiceManager : NSObject{
    
    //MARK:-Variables
    weak var delegate:ServiceManagerDelegate?  =  nil
    
    //MARK:- Functions
    func prepareURLForResource(path:String)->String{
        return String(format: "%@%@", EndPoint.kServerBase,path)
    }
    
    func RestApi(postPath:String,parameters:Parameters? = nil,reqType:RequestType,method:HTTPMethod)   {
        let postURL = prepareURLForResource(path:postPath)
        let token = USER.shared.token
        let header: HTTPHeaders? = [.authorization(bearerToken: token)]
       
        
        consoleLog("\(method) CALL : \(postURL)",parameters ?? [:])
       AF.request(postURL,
                  method:method,parameters:parameters, encoding:JSONEncoding.default, headers:  header)
        .response{ response  in
                if response.error == nil {
                        
                   let stausCode = response.response?.statusCode
                   
                    guard let data = response.value else {
                        return
                    }
                    
                switch stausCode {
                    case  200,201,204:
                        self.delegate?.requestFinished(responseData: response.value as Any, reqType: reqType)
                    default:
                        let str = String(decoding: (data!), as: UTF8.self)
                        consoleLog(str)
                        self.delegate?.requestFailed(Data: nil, Error:str, reqType: reqType)
                    }
                    consoleLog(response.value as Any)
                    
                }else{
                    let error = response.error?.localizedDescription ?? ""
                    consoleLog(error)
                    self.delegate?.requestFailed(Data: nil, Error:Constants.serverError, reqType: reqType)
                }
            }
      }
      
}
    
    
typealias Parameters = [String:Any]
