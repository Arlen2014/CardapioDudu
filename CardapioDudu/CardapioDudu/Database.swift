//
//  Database.swift
//  CardapioDudu
//
//  Created by Arlen Pereira on 05/04/16.
//  Copyright © 2016 Arlen. All rights reserved.
//

import Foundation
import Firebase

class Database
{
    static let dataBase = Database()
    
    private var _URL_REF = Firebase(url: "\(BASE_URL)")
    private var _PRODUCT_REF = Firebase(url: "\(BASE_URL)/Lanches")
    private var _INFO_REF = Firebase(url: "\(BASE_URL)/Informacoes")
    
    var URL_REF: Firebase
    {
        return _URL_REF
    }
    
    var PRODUCT_REF: Firebase
    {
        return _PRODUCT_REF
    }
    
    var INFO_REF: Firebase
    {
        return _INFO_REF
    }
}
