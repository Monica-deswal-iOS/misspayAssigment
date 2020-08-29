//
//  ScanBarcodeViewController.swift
//  MishipayAssignment
//
//  Created by Monica Deswal on 29/08/20.
//  Copyright © 2020 Monica Deswal. All rights reserved.
//

import UIKit

class ScanBarcodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SaveProductDetails.createData()
        SaveProductDetails.retrieveData()

        // Do any additional setup after loading the view.
    }
    



}
