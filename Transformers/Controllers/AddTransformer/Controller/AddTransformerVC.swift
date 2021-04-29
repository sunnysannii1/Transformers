//
//  AddTransformerVC.swift
//  Transformers
//
//  Created by Ahsan Ali on 28/04/2021.
//

import UIKit
import IQDropDownTextField
class AddTransformerVC: BaseVC {

    // MARK: - Vars
    
    // MARK: - Outlets
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet var allTextObject : Array<IQDropDownTextField> = []
    @IBOutlet weak var txtRank: IQDropDownTextField!
    @IBOutlet weak var txtCourage: IQDropDownTextField!
    @IBOutlet weak var txtSpeed: IQDropDownTextField!
    @IBOutlet weak var txtSkill: IQDropDownTextField!
    @IBOutlet weak var txtIntelligance: IQDropDownTextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtTeam: IQDropDownTextField!
    @IBOutlet weak var txtEndurance: IQDropDownTextField!
    @IBOutlet weak var txtFirePower: IQDropDownTextField!
    @IBOutlet weak var txtStrength: IQDropDownTextField!
   
    // MARK: - Variables
    var isUpdate = false
    var item:Transformer?
    private var addViewModel:AddTransformerViewModel!
    
    // MARK: - Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
   
    // MARK: - Actions
    @IBAction func ADDAction(_ sender: Any) {
       //validate all  your mendatory textfields
        let msg = validateDropDowns()
        if msg == "" {
            
            let tranformer = Transformer(courage: (txtCourage  as UITextField).text?.intValue, endurance: (txtEndurance as UITextField).text?.intValue, firepower: (txtFirePower as UITextField).text?.intValue, id: item?.id, intelligence: (txtIntelligance as UITextField).text?.intValue, name: txtName.text!, rank: (txtRank as UITextField).text?.intValue, skill: (txtSkill as UITextField).text?.intValue, speed: (txtSpeed as UITextField).text?.intValue, strength: (txtStrength as UITextField).text?.intValue, team: (txtTeam as UITextField).text, teamIcon: item?.teamIcon)
            addViewModel = AddTransformerViewModel(bot: tranformer,isUpdate: isUpdate)
            addViewModel.bindViewModelToController = {
                appUtil.shared.showAlert(message: self.isUpdate ? "updated Successfully" : "Added Successfully")
            }
        }else{
            appUtil.shared.showAlert(message: msg)
        }
        
    }
    
    // MARK: - Helpers
    private func setViews(){
        btnAdd.setTitle(isUpdate ? "Update" : "ADD", for: .normal)
        lblHeader.text = isUpdate ? "Update Transformer" : "ADD Transformer"
        let items = ["1","2","3","4","5","6","7","8","9","10"]
        txtTeam.itemList = ["A","D"]
        for field in allTextObject {
            field.itemList = items
        }
        
        if isUpdate {
            
            txtRank.selectedItem = item?.rank?.description
            txtCourage.selectedItem = item?.courage?.description
            txtSpeed.selectedItem = item?.speed?.description
            txtSkill.selectedItem = item?.skill?.description
            txtIntelligance.selectedItem = item?.intelligence?.description
            txtName.text = item?.name?.description
            txtTeam.selectedItem = item?.team?.description
            txtEndurance.selectedItem = item?.endurance?.description
            txtFirePower.selectedItem = item?.firepower?.description
            txtStrength.selectedItem =  item?.strength?.description
        }
        
    }
    
    private func validateDropDowns()-> String{
       
        
        if  let error = Validator().validate(text: txtName.text!, with: [.notEmpty,.validateName]){
            return error
        }
        
        for field in allTextObject {
            if  let error = Validator().validate(text: (field  as UITextField).text ?? "", with: [.notEmpty]){
                return error
            }
        }
        return ""
    }
}
