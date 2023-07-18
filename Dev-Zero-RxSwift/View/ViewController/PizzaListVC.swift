//
//  PizzaListVC.swift
//  Dev-Zero-RxSwift
//
//  Created by Eniola Anthony on 7/18/23.
//

import Foundation
import UIKit

final class PizzaListVC: UIViewController {
    
    private let rootView = PizzaListHomeView()
    let pizzaViewModel = PizzaViewModel()
    private var loading =  true
    var menuItems = [MenuItem]()  {
        didSet {
            DispatchQueue.main.async {
                self.rootView.tableView.reloadData()
            }
        }
    }
    var productImage = UIImage()
    var productImageOnChange: UIImage? {
        didSet {
            productImage = productImageOnChange ?? UIImage()
        }
    }
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pizzaViewModel.loadMenuItems { items in
            self.menuItems = items
        }
        rootView.tableView.register(PizzaInfoTableViewCell.self, forCellReuseIdentifier: PizzaInfoTableViewCell.identifier)
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
    
}


extension PizzaListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PizzaInfoTableViewCell.identifier, for: indexPath) as! PizzaInfoTableViewCell
            let menuItem = self.menuItems[indexPath.row]
            cell.configure(model: menuItem)
        return cell
    }
}


extension PizzaListVC : UITableViewDelegate {
    
    
    
}


struct Profile {
    let name: String
    let imageName: String
}
