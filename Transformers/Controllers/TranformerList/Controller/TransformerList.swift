//
//  TransformerList.swift
//  Transformers
//
//  Created by Ahsan Ali on 29/04/2021.
//

import UIKit

class TransformerList: BaseVC {

    //MARK:- Outlets
    @IBOutlet weak var transfomerTV: UITableView! {
        didSet{
            transfomerTV.tableFooterView = UIView()
        }
    }
   
    //MARK:- Vars
    private var dataSource : TransformerDataSource<TransformerCell,Transformer>!
    private var transformeViewModel:TransformerListViewModel!
    
    private var items = [Transformer]()
    //MARK:- Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setTransformers()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        transformeViewModel.getList()
    }
    //MARK:- Actions
    @IBAction func Rmove(_ sender: UIButton) {
        
        transformeViewModel.remove(id: items[sender.tag].id ?? "")
        transformeViewModel.bindViewModelToController = {
            DispatchQueue.main.async {
                self.items.remove(at: self.items.firstIndex(where: {$0.id == self.items[sender.tag].id})!)
                self.transfomerTV.reloadData()
                }
        }
    }
    
    //MARK:- Helpers
    private func setTransformers(){
        
        transformeViewModel = TransformerListViewModel()
        transformeViewModel.bindViewTransformersToController = { items in
            self.dataSource = TransformerDataSource(items: items)
            self.items = items
            self.transfomerTV.dataSource = self.dataSource
            self.transfomerTV.reloadData()
        }
    }
    
    
    
}

extension TransformerList : UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        TransformerListRouter().route(to: AddTransformerVC.className, from: self, parameters: items[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
