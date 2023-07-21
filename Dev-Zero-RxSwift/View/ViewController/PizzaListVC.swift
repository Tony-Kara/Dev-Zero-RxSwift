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
    
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didTapNextBtn()
        rootView.delegate = self
        pizzaViewModel.loadMenuItems { items in
            self.menuItems = items
        }
        rootView.tableView.register(PizzaInfoTableViewCell.self, forCellReuseIdentifier: PizzaInfoTableViewCell.identifier)
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
    
    private func didTapNextBtn() {
        rootView.onNextScreenTapped =  {
            let profileInfoListVC = ProfileInfoVC()
            self.navigationController?.pushViewController(profileInfoListVC, animated: true)
        }
    }
    
}


extension PizzaListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PizzaInfoTableViewCell.identifier, for: indexPath) as! PizzaInfoTableViewCell
            let menuItem = self.menuItems[indexPath.row]
        guard let imageUrl = menuItem.image else { return cell }
        pizzaViewModel.getProductImage(with: imageUrl) { itemImage in
            cell.configure(model: menuItem, image: itemImage)
        }
        return cell
    }
}


extension PizzaListVC : UITableViewDelegate {
    
    
    
}

extension PizzaListVC: PizzaListHomeViewDelegate {
    func tapToNextScreen() {
        let profileInfoListVC = ProfileInfoVC()
       self.navigationController?.pushViewController(profileInfoListVC, animated: true)
    }
}


struct Profile {
    let name: String
    let imageName: String
}
