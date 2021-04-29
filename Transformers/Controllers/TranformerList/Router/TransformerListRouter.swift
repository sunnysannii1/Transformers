//
//  TransformerListRouter.swift
//  Transformers
//
//  Created by Ahsan Ali on 29/04/2021.
//

import UIKit

class TransformerListRouter: Router {
    func route(to routeID: String, from context: UIViewController, parameters: Transformer?) {
        
        let vc = UIStoryboard.main.instantiateViewController(withIdentifier: AddTransformerVC.className) as! AddTransformerVC
        vc.isUpdate = true
        vc.item = parameters
        context.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
