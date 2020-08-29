//
//  ProductListViewController.swift
//  MishipayAssignment
//
//  Created by Monica Deswal on 29/08/20.
//  Copyright © 2020 Monica Deswal. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var productArray = [StoreModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInterface()
        fetchDatabase()

    }

    func setUpInterface() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
    }
    
    func fetchDatabase() {
       productArray = SaveProductDetails.retrieveData()
    }
    
}

extension ProductListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell 
        cell.popuatingTheCell(modelObject: productArray[indexPath.row])
        return cell
    }
    
    
}

