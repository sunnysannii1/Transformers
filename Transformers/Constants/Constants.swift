//
//  Constants.swift
//  Transformers
//
//  Created by Ahsan Ali on 28/04/2021.
//

import Foundation

func consoleLog(_ items: Any...){
    #if DEBUG
       print(items)
    #endif
    
}


// MARK: - Constants
enum Constants {
    static let serverError  = "Server not responding"
}
