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
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.2602918744, blue: 0.4414015412, alpha: 1)
    }
    
    func fetchDatabase() {
    
       productArray = SaveProductDetails.retrieveCrudArray()
    }
    
}

extension ProductListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.selectionStyle = .none
        cell.popuatingTheCell(modelObject: productArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewControllerObject = storyboard.instantiateViewController(identifier: "ProductDetailViewController") as? ProductDetailViewController{
            viewControllerObject.modelObject = productArray[indexPath.row]
            self.navigationController?.pushViewController(viewControllerObject, animated: true)
        }
        
    }
    
    
}

