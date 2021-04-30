//
//  RageWarVC.swift
//  Transformers
//
//  Created by Ahsan Ali on 29/04/2021.
//

import UIKit

class RageWarVC: BaseVC {
    
    // MARK: - Vars
    
    
    
    var rageViewModel:RageWarViewModel!
    // MARK: - Oulets
    @IBOutlet weak var lblResult: UILabel!
    // MARK: - Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        lblResult.text = "Getting Transformers ..."
        rageViewModel = RageWarViewModel()
        rageViewModel.rageWar()
        rageViewModel.bindResultToController = { [self] (result)  in
            lblResult.text = result
        }
    }
    
}
