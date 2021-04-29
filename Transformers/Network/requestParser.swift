//
//  requestParser.swift
//  Transformers
//
//  Created by Ahsan Ali on 28/04/2021.
//


import Foundation

class RequestParser: NSObject {
    //MARK:- Varibales
   private let newJSONDecoder = JSONDecoder()
    
    
    //MARK:- Helpers
    func parseResponse(response:Data,reqType:RequestType)->Any?{
        var items:Any?
    
        switch reqType {
        case .getToken:
            items = String(decoding: response, as: UTF8.self)
        case .transformers,.deleteTransformer:
             JSONParserFromStruct().parse(of: TransformsItems.self, from: response, completion: { (result) in
                items = result
            })
            
        case .Addtransformer :
            JSONParserFromStruct().parse(of: Transformer.self, from: response, completion: { (result) in
               items = result
           })
        }
        
        return items
 }
    
    //MARK:- Rest Api's
   
   
    
    
    
    
    
    
    
    
    class JSONParserFromStruct {
        typealias ResultBlock<T> = (Result <T, Error>) -> Void

        func parse<T: Decodable>(of type: T.Type,
                                          from data: Data,
                                          completion: @escaping ResultBlock<T>) {

            do {
               
                let decodedData: T = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            }
            catch {
                completion(.failure(error))
            }
        }
    }
    
    
   
   
}

