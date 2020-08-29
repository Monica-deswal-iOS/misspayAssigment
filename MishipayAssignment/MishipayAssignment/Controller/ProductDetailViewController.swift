//
//  ProductDetailViewController.swift
//  MishipayAssignment
//
//  Created by Monica Deswal on 29/08/20.
//  Copyright © 2020 Monica Deswal. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productId: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productBrand: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var modelObject : StoreModel? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
        self.textField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func displayData() {
        self.productImage.image = UIImage(named: modelObject?.productImage ?? "1.png")
        self.productId.text = modelObject?.productId
        self.productName.text = modelObject?.productName
        self.productBrand.text = modelObject?.brand
        self.productDescription.text = modelObject?.productDescription
        self.productPrice.text = modelObject?.price
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    @IBAction func addProductToCart(_ sender: UIButton) {
        let alert = UIAlertController(title: "Added the product to the cart", message:"", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    

    
}
