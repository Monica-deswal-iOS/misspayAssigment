//
//  StoreModel.swift
//  MishipayAssignment
//
//  Created by Monica Deswal on 29/08/20.
//  Copyright © 2020 Monica Deswal. All rights reserved.
//

import Foundation

struct StoreModel {
    let productName : String
    let brand : String
    let price : String
    let productDescription : String
    let productId : String
    let productImage : String
    
    init(productName : String, brand : String, price : String , productDescription : String, productId : String,  productImage : String) {
        self.productName = productName
        self.brand = brand
        self.price = "₹" + price
        self.productDescription = productDescription
        self.productId = productId
        self.productImage = productImage
    }
}
