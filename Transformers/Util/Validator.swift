//
//  Validator.swift
//  Transformers
//
//  Created by Ahsan Ali on 28/04/2021.
//

import Foundation
class Validator {
    
    func validate(text:String,with rules: [Rule])->String? {
        return rules.compactMap({$0.check(text)}).first
    }
}

struct Rule {
    
    let check: (String) -> String?
    
    static let notEmpty = Rule(check: {
        return $0.isEmpty ? "Fields Must not be empty" : nil
    })
    
    
    static let validateName = Rule(check:  {
        return NSPredicate(format: "SELF MATCHES %@", "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$").evaluate(with: $0) ? nil : "Invalid Name"
        
    })
    
 
}
