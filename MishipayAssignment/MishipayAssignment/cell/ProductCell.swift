//
//  TableViewCell.swift
//  MishipayAssignment
//
//  Created by Monica Deswal on 29/08/20.
//  Copyright © 2020 Monica Deswal. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       // imageView?.contentMode = .scaleAspectFit
        self.imageView?.clipsToBounds = true
        // Initialization code
    }
    
    func popuatingTheCell(modelObject : StoreModel){
        self.id.text = modelObject.productId
        self.brand.text = modelObject.brand
        self.productName.text = modelObject.productName
        self.price.text = modelObject.price
        
        self.imageView?.image =  UIImage(named: modelObject.productImage, in: Bundle(for: type(of: self)), compatibleWith: nil)
        
    }
    
}
