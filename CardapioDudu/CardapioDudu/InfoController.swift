//
//  InfoController.swift
//  CardapioDudu
//
//  Created by Arlen Pereira on 05/04/16.
//  Copyright © 2016 Arlen. All rights reserved.
//

import UIKit
import Firebase

class InfoController: UIViewController
{
    
    @IBOutlet weak var localLabel: UILabel!
    
    @IBOutlet weak var bairroLabel: UILabel!
    
    @IBOutlet weak var cidadeLabel: UILabel!
    
    @IBOutlet weak var telefoneLabel: UILabel!
    
    @IBOutlet weak var siteLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var comentario: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        Database.dataBase.INFO_REF.observeEventType(.Value, withBlock:
        { snapshot in
            
//            print("INFO : \(snapshot.value)")
            
            self.localLabel.text = snapshot.value["local"] as? String
            
            self.bairroLabel.text = snapshot.value["bairro"] as? String
            
            self.cidadeLabel.text = snapshot.value["cidade"] as? String
            
            self.telefoneLabel.text = snapshot.value["telefone"] as? String
            
            self.siteLabel.text = snapshot.value["site"] as? String
            
            self.emailLabel.text = snapshot.value["email"] as? String
            
            self.comentario.text = snapshot.value["observacao"] as? String
        })
        
    }
}
