//
//  TransformerCell.swift
//  Transformers
//
//  Created by Ahsan Ali on 29/04/2021.
//

import UIKit
import AlamofireImage
class TransformerCell: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTeam: UILabel!
    @IBOutlet weak var lblEndurance: UILabel!
    @IBOutlet weak var lblCourage: UILabel!
    @IBOutlet weak var lblSpeed: UILabel!
    @IBOutlet weak var lblSkill: UILabel!
    @IBOutlet weak var lblIntelligance: UILabel!
    @IBOutlet weak var lblRank: UILabel!
    @IBOutlet weak var lblFirepower: UILabel!
    @IBOutlet weak var lblstrength: UILabel!
    @IBOutlet weak var lblOverAll: UILabel!
   
    @IBOutlet weak var btnRemove: UIButton!
    
    //MARK:- Cycles
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func draw(_ rect: CGRect) {
        icon.layer.cornerRadius = icon.bounds.height * 0.5
        icon.layer.borderColor = UIColor.black.cgColor
        icon.layer.borderWidth = 1
    }
    
    
    
    
    func setData(item:Transformer){
        // SET ICON
        if let url = URL(string: item.teamIcon!) {
            self.icon.af.setImage(withURL: url)
            
        }
        //SET PROPERTIES
        lblName.text = item.name
        lblTeam.text = item.team
        lblEndurance.text = item.endurance?.description
        lblCourage.text = item.courage?.description
        lblSpeed.text = item.speed?.description
        lblSkill.text = item.skill?.description
        lblIntelligance.text = item.intelligence?.description
        lblRank.text = item.rank?.description
        lblFirepower.text = item.firepower?.description
        lblstrength.text = item.strength?.description
        //FORMULA
        //Strength + Intelligence + Speed + Endurance + Firepower
        let formula1 = (item.strength ?? 0) + (item.intelligence ?? 0)  + (item.speed ?? 0)
        let overAll =  (formula1) + (item.endurance  ?? 0) + (item.firepower ?? 0)
        
        lblOverAll.text = overAll.description
        
        
        
    }
    

    
    
}
