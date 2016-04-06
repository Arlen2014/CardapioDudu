//
//  ProductList.swift
//  CardapioDudu
//
//  Created by Arlen Pereira on 05/04/16.
//  Copyright © 2016 Arlen. All rights reserved.
//

import UIKit
import Firebase

class ProductList: UIViewController, UITableViewDelegate
{
    var products = [Products]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        queryProducts()
    }
    
    func queryProducts()
    {
        Database.dataBase.PRODUCT_REF.observeEventType(.Value, withBlock:
        { snapshot in
            
            self.products = []
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]
            {
                for snap in snapshots
                {
                    if let productDict = snap.value as? Dictionary < String, AnyObject>
                    {
                        let key = snap.key
                        let product = Products(key: key, dictionary: productDict)
                        
                        self.products.insert(product, atIndex: self.products.count)
                    }
                }
            }
            
            self.tableView.reloadData()
        })
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let product = products[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? ProductsCell
        
            cell?.keyLabel.text = product.productKey
            cell?.nameLabel.text = product.productName
            cell?.descLabel.text = product.productDesc
            cell?.priceLabel.text = product.productPrice
        
            return cell!
    }
}
