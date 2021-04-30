//
//  StartVC.swift
//  Transformers
//
//  Created by Ahsan Ali on 28/04/2021.
//

import UIKit

class StartVC: BaseVC {

    // MARK: - Vars
    
    private var startViewModel:StartViewModel!
    
    
    // MARK: - Cycles
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getToken()
    }
    
    
    
    // MARK: - Actions
    
    
    @IBAction func StartAction(_ sender: UIButton) {
        
        var route = TransformerList.className
        if sender.tag == 0 {
            route = AddTransformerVC.className
        }else if sender.tag == 2 {
            route = RageWarVC.className
        }
        
        StartRouter().route(to: route, from: self, parameters: nil)
    }
    
    // MARK: - Helpers
    
    private func getToken(){
        if USER.shared.token == "" {
        startViewModel = StartViewModel()
        startViewModel.bindViewModelToController = {
            
        }
        }
    }
    
}
