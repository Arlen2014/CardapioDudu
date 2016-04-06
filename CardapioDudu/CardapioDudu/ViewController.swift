//
//  ViewController.swift
//  CardapioDudu
//
//  Created by Arlen Pereira on 01/04/16.
//  Copyright © 2016 Arlen. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController
{
    
    let diretorio = "https://cardapiolanche.firebaseio.com/Lanches"

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myRootRef = Firebase(url:diretorio)
        
        myRootRef.observeEventType(.Value, withBlock: {
            snapshot in
            print("\(snapshot.key) -> \(snapshot.value)")
        })
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

