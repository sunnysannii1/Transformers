//
//  StartRouter.swift
//  Transformers
//
//  Created by Ahsan Ali on 28/04/2021.
//

import UIKit

class StartRouter: Router {
    func route(to routeID: String, from context: UIViewController, parameters: Transformer?) {
        
        if routeID == AddTransformerVC.className {
            let vc = UIStoryboard.main.instantiateViewController(withIdentifier: AddTransformerVC.className) as! AddTransformerVC
            context.navigationController?.pushViewController(vc, animated: true)
        }
        else
        if routeID == RageWarVC.className {
            let vc = UIStoryboard.main.instantiateViewController(withIdentifier: RageWarVC.className) as! RageWarVC
            context.navigationController?.pushViewController(vc, animated: true)
        }
        else{
            let vc = UIStoryboard.main.instantiateViewController(withIdentifier: TransformerList.className) as! TransformerList
            context.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
