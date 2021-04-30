//
//  USER.swift
//  Transformers
//
//  Created by Ahsan Ali on 28/04/2021.
//

import Foundation
import SwiftKeychainWrapper
struct USER {
    // MARK: - Vars
    static var shared = USER()
    var token = ""
    private let tokenKey = "userToken"
    private var defaults:UserDefaults {
        return UserDefaults.standard
    }
    // MARK: - Cycles
    private init() {}
        
    // MARK: - Helpers
    //Access User Token from Keychain
    mutating func getToken(){
        self.token =  KeychainWrapper.standard.string(forKey: tokenKey) ?? ""
   
    }
    
    //Store User Token in Keychain
    mutating func setToken(_ tokenStr:String){
         self.token = tokenStr
        KeychainWrapper.standard.set(tokenStr, forKey: tokenKey)
    }
    //Clear User after game finishes
    mutating func clear(){
        self.token =  ""
        KeychainWrapper.standard.remove(forKey: KeychainWrapper.Key(rawValue: tokenKey))
    }
    
    
}
