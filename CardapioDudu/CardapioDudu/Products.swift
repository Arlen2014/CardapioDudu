//
//  Products.swift
//  CardapioDudu
//
//  Created by Arlen Pereira on 05/04/16.
//  Copyright © 2016 Arlen. All rights reserved.
//

import Foundation
import Firebase

class Products
{
    private var _productRef: Firebase!
    
    private var _productKey: String!
    private var _productName: String!
    private var _productDesc: String!
    private var _productPrice: String!
    private var _productCateg: String!
    
    var productKey: String
    {
        return _productKey
    }
    
    var productName: String
    {
        return _productName
    }
    
    var productDesc: String
    {
        return _productDesc
    }
    
    var productPrice: String
    {
        return _productPrice
    }

    var productCategory: String
    {
        return _productCateg
    }

    init(key: String, dictionary: Dictionary < String, AnyObject >)
    {
        self._productKey = key
        
//        print("KEY: \(productKey)")
        
        if let nome = dictionary["nome"] as? String
        {
//            print("NAME: \(nome)")
            self._productName = nome
        }
        
        if let descricao = dictionary["descricao"] as? String
        {
//            print("DESCRIPTION: \(descricao)")
            self._productDesc  = descricao
        }

        if let preco = dictionary["preco"] as? String
        {
//            print("PRICE: \(preco)")
            self._productPrice = preco
        }
        
        if let tipo = dictionary["tipo"] as? String
        {
//            print("CATEGORY: \(tipo)")
            self._productCateg = tipo
        }
        
        self._productRef = Database.dataBase.PRODUCT_REF.childByAppendingPath(self._productKey)
    }
}
