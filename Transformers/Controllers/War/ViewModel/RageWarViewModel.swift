//
//  RageWarViewModel.swift
//  Transformers
//
//  Created by Ahsan Ali on 30/04/2021.
//

import UIKit

class RageWarViewModel: BaseViewModel {

    // MARK: - Vars
    private var listViewModel:TransformerListViewModel!
    private var result  = "INPUT:\n"
    private var autobotWins = 0
    private var decepticonWins = 0
    private var numberofBattles = 0
    private var totalTies = 0
    private var winingNamesAutobots = ""
    private var winingNamesDecepticons = ""
    private var servivors = ""
    private var allDestroyed = false
    private var currentWarWonbyMasterRule = false
    var bindResultToController : ((String) -> ()) = {_ in }
    // MARK: - Cycles
    override init() {
        super.init()
        listViewModel = TransformerListViewModel()
        listViewModel.getList()
    }
    
    func rageWar(){
        listViewModel.bindViewTransformersToController = { items in
        
            
            if items.count == 0 {
                appUtil.shared.showAlert(message: "No Bots Found to Rage Fight!")
                return
            }
            
            
            //Filter Teams
            let autobots = items.filter({$0.team == "A"}).sorted(by: { $0.rank ?? 0 > $1.rank ?? 0 })
            let decepticons = items.filter({$0.team == "D"}).sorted(by: { $0.rank ?? 0 > $1.rank ?? 0 })
            // Filter Extra Transformers
            var loopCount = autobots.count
            if decepticons.count < loopCount {
                loopCount = decepticons.count
            }
            
            // Face OFF ONE ON ONE
            self.numberofBattles = loopCount
            if loopCount == 0 {
                appUtil.shared.showAlert(message: "No opponent found!")
                return
            }
            for index in 0...loopCount - 1 {
            
                self.result += autobots[index].toString()
                self.result += decepticons[index].toString()
            }
            
            // Getting Remaining Bots which can't Fight
            //Decepticons Remaining
            var remaingBotsCount = loopCount
            if remaingBotsCount < autobots.count {
                remaingBotsCount = autobots.count
                for index in loopCount...remaingBotsCount - 1 {
                    self.result += autobots[index].toString()
                    //servivors with in Autobots
                    self.servivors += "\(decepticons[index])"
                }
            } //Autobots Remainings
            else if remaingBotsCount < decepticons.count {
                remaingBotsCount = decepticons.count
                for index in loopCount...remaingBotsCount - 1 {
                    self.result += decepticons[index].toString()
                    //servivors with in decepticon
                    self.servivors += "\(decepticons[index].name!)"
                }
            }
            
            self.result += "\n\nOUTPUT:\n Number of Battles:\(self.numberofBattles)"
            
            //START FIGHT
            for index in 0...self.numberofBattles - 1 {
                // Apply Master Rule
                self.startBattleMasterRule(A: autobots[index], D: decepticons[index])
                // Battle
                if self.currentWarWonbyMasterRule == false {
                    self.ranAwayRuleWithBattle(A: autobots[index], D: decepticons[index])
                }else{
                    self.currentWarWonbyMasterRule.toggle()
                }
            }
            
            
            
            self.decideWin()
            self.bindResultToController(self.result)
            
        }
    }
    
    private func decideWin(){
        
        if self.allDestroyed == false {
        
        if self.autobotWins > self.decepticonWins {
            self.result += "\n\nWinning Team(Autobots) \(self.winingNamesAutobots)"
            if servivors != "" {
                self.result += "\n\nSurvivors from the losing team (Decepticons): \(servivors) "
            }
        
        }
        else if self.decepticonWins > self.autobotWins {
            self.result += "\n\nWinning Team(Decepticons) \(self.winingNamesDecepticons)"
            if servivors != "" {
                self.result += "\n\nSurvivors from the losing team (Autobots): \(servivors) "
            }
        }else{
            self.result += "\n\nWinning Team(TIE) Total Tie Rounds\(self.totalTies)"
        }
     }
    }
    
    private func ranAwayRuleWithBattle(A:Transformer,D:Transformer){
        if allDestroyed == false {
        
        if ((A.courage ?? 0) - 4) > D.courage ?? 0 &&
           ((A.strength ?? 0) - 3) > D.strength ?? 0 {
            
            self.autobotWins += 1
            self.winingNamesAutobots += "\(A.name!) "
            
        }
        else
        if ((D.courage ?? 0) - 4) > A.courage ?? 0 &&
           ((D.strength ?? 0) - 3) > A.strength ?? 0 {
            
            self.decepticonWins += 1
            self.winingNamesDecepticons += "\(A.name!) "
            
        }
        else if A.overAllRating > D.overAllRating {
            self.autobotWins += 1
            self.winingNamesAutobots += "\(A.name!) "
        }
        else if D.overAllRating > A.overAllRating {
            self.decepticonWins += 1
            self.winingNamesDecepticons += "\(A.name!) "
        }
        else{
            totalTies += 0
        }
        
        
        
        
        }
        
    }
   
    
    private func startBattleMasterRule(A:Transformer,D:Transformer){
        // if Optimus Prime is Fighting again any other Decepticon other than predaking
        if A.isOptimusPrime {
            if !D.isPredaking {
                self.autobotWins += 1
                winingNamesAutobots += "\(A.name!) "
                currentWarWonbyMasterRule = true
                return
            }
        }
        
        // if Optimus Prime is Fighting predaking OR DUPLICATE
        if  A.isOptimusPrime  && D.isPredaking ||
            A.isOptimusPrime  && D.isOptimusPrime ||
            A.isPredaking  && D.isPredaking  ||
            A.isPredaking  && D.isOptimusPrime {
            allDestroyed = true
            self.result += "\n\n ALL OPONENTS DESTROYED DURING OPTIMUS & PREDAKING FIGHT"
            USER.shared.clear()
            return
        }
        // if Predaking  is Fighting again any other Decepticon other than Optimus Prime
        if D.isOptimusPrime {
            if !A.isPredaking {
                self.decepticonWins += 1
                winingNamesDecepticons += "\(D.name!) "
                currentWarWonbyMasterRule = true
                return
            }
        }
    }
    
    
    
    
    
}
