//
//  SaveProductDetails.swift
//  MishipayAssignment
//
//  Created by Monica Deswal on 29/08/20.
//  Copyright © 2020 Monica Deswal. All rights reserved.
//

import Foundation
import CoreData

class SaveProductDetails {
    static let productDetails : [[String : String]] = [["productName" : "milk tined",
                                                        "brand": "Amul",
                                                        "price":"30",
                                                        "productDescription":"Milk is a white, nutrient-rich liquid food produced in the mammary glands of mammals. It is the primary source of nutrition for infant mammals",
                                                        "productId":"0001",
                                                        "productImage":"1"],
                                                       ["productName" : "milk",
                                                        "brand": "Nandini",
                                                        "price":"40",
                                                        "productDescription":"Milk is a white, nutrient-rich liquid food produced in the mammary glands of mammals. It is the primary source of nutrition for infant mammals",
                                                        "productId":"0002",
                                                        "productImage":"2"],
                                                       ["productName" : "milk",
                                                        "brand": "Amul",
                                                        "price":"45",
                                                        "productDescription":"Milk is a white, nutrient-rich liquid food produced in the mammary glands of mammals. It is the primary source of nutrition for infant mammals",
                                                        "productId":"0003",
                                                        "productImage":"3"],
                                                       ["productName" : "Biscuit",
                                                        "brand": "Marry gold",
                                                        "price":"40",
                                                        "productDescription":"A biscuit is a flour-based baked food product. Outside North America the biscuit is typically hard, flat, and unleavened; in North America it is typically a soft, leavened quick bread.",
                                                        "productId":"0004",
                                                        "productImage":"4"],
                                                       ["productName" : "Butter",
                                                        "brand": "Amul",
                                                        "price":"105",
                                                        "productDescription":"t is made by churning milk or cream to separate the fat globules from the buttermilk. Salt and food colorings are sometimes added to butter. Rendering butter, removing the water and milk solids, produces clarified butter or ghee, which is almost entirely butterfat.",
                                                        "productId":"0005",
                                                        "productImage":"5"],
                                                       ["productName" : "milk tined",
                                                        "brand": "Amul",
                                                        "price":"30",
                                                        "productDescription":"Milk is a white, nutrient-rich liquid food produced in the mammary glands of mammals. It is the primary source of nutrition for infant mammals",
                                                        "productId":"0006",
                                                        "productImage":"6"],
                                                       ["productName" : "milk",
                                                        "brand": "Nandini",
                                                        "price":"40",
                                                        "productDescription":"Milk is a white, nutrient-rich liquid food produced in the mammary glands of mammals. It is the primary source of nutrition for infant mammals",
                                                        "productId":"0007",
                                                        "productImage":"7"],
                                                       ["productName" : "milk",
                                                        "brand": "Amul",
                                                        "price":"45",
                                                        "productDescription":"Milk is a white, nutrient-rich liquid food produced in the mammary glands of mammals. It is the primary source of nutrition for infant mammals",
                                                        "productId":"0008",
                                                        "productImage":"8"],
                                                       ["productName" : "Biscuit",
                                                        "brand": "Marry gold",
                                                        "price":"40",
                                                        "productDescription":"A biscuit is a flour-based baked food product. Outside North America the biscuit is typically hard, flat, and unleavened; in North America it is typically a soft, leavened quick bread.",
                                                        "productId":"0009",
                                                        "productImage":"9"],
                                                       ["productName" : "Butter",
                                                        "brand": "Amul",
                                                        "price":"105",
                                                        "productDescription":"t is made by churning milk or cream to separate the fat globules from the buttermilk. Salt and food colorings are sometimes added to butter. Rendering butter, removing the water and milk solids, produces clarified butter or ghee, which is almost entirely butterfat.",
                                                        "productId":"0010",
                                                        "productImage":"10"]
    ]
    
    static var saveDataArray: [StoreModel] {
        get {
            return SaveProductDetails.retrieveCrudArray()
        }
    }
    
    static func createData(){
        let appDelegate = AppDelegate()
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: storeCRUD, in: managedContext)!
        
        for product in productDetails {
            
            let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
            
            user.setValue(product["productName"]!, forKeyPath: "productName")
            user.setValue(product["brand"], forKeyPath: "brand")
            user.setValue(product["price"], forKeyPath: "price")
            user.setValue(product["productDescription"], forKeyPath: "productDescription")
            user.setValue(product["productId"]!, forKeyPath: "productId")
            user.setValue(product["productImage"], forKeyPath: "productImage")
        }
        do {
            print("saved the data in the database")
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    static func retrieveCrudArray()  -> [StoreModel]{
        let appDelegate = AppDelegate()
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: storeCRUD)
        
        var storeModelArray = [StoreModel]()
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                if let productName : String = data.value(forKey: "productName") as? String, let brand : String = data.value(forKey: "brand") as? String,  let price : String = data.value(forKey: "price") as? String ,  let productDescription : String  = data.value(forKey: "productDescription") as? String ,  let productId : String = data.value(forKey: "productId") as? String ,    let productImage : String  = data.value(forKey: "productImage") as? String {
                    let storeObject = StoreModel(productName: productName, brand: brand, price: price, productDescription: productDescription, productId: productId, productImage: productImage)
                    storeModelArray.append(storeObject)
                }
            }
            return storeModelArray
        } catch {
            return storeModelArray
            print("Failed")
        }
    }
    
    
}
