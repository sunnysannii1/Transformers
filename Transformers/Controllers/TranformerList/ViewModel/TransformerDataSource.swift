//
//  TransformerDataSource.swift
//  Transformers
//
//  Created by Ahsan Ali on 29/04/2021.
//

import UIKit
import Alamofire
class TransformerDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource,UITableViewDelegate {
    
    
    private var items : [Transformer]!
    
    
    init(items : [Transformer]) {
        self.items =  items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransformerCell.className) as! TransformerCell
        cell.btnRemove.tag = indexPath.row
        cell.setData(item: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
