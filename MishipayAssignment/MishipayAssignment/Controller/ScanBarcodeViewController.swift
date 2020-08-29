//
//  ScanBarcodeViewController.swift
//  MishipayAssignment
//
//  Created by Monica Deswal on 29/08/20.
//  Copyright © 2020 Monica Deswal. All rights reserved.
//

import UIKit

class ScanBarcodeViewController: UIViewController {
    
    @IBOutlet weak var scannerView: QRScannerView!{
        didSet {
            scannerView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.2602918744, blue: 0.4414015412, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !scannerView.isRunning {
            scannerView.startScanning()
        }
    }
    
}

extension ScanBarcodeViewController: QRScannerViewDelegate {
    func qrScanningDidStop() {
        print("scanning is finished")
    }
    
    func qrScanningDidFail() {
        print("Fail to scan ")
    }
    
    func qrScanningSucceededWithCode(_ str: String?) {
        self.redirectToProductDetailsPage()
    }
}

//MARK: - Redirection to the product details view controller
extension ScanBarcodeViewController {
    func redirectToProductDetailsPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewControllerObject = storyboard.instantiateViewController(identifier: "ProductDetailViewController") as? ProductDetailViewController{
            viewControllerObject.modelObject = SaveProductDetails.saveDataArray[0]
            self.navigationController?.pushViewController(viewControllerObject, animated: true)
        }
    }
}

