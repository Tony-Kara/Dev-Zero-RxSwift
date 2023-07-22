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
        rootView.tableView.register(DrinksToGoTableViewCell.self, forCellReuseIdentifier: DrinksToGoTableViewCell.identifier)
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
        rootView.bannerViewCollection.register(AdvertisementBannerCollectionCell.self, forCellWithReuseIdentifier: AdvertisementBannerCollectionCell.identifier)
        rootView.bannerViewCollection.dataSource = self
        rootView.bannerViewCollection.delegate = self
    }
    
    private func didTapNextBtn() {
        rootView.onNextScreenTapped =  {
            let profileInfoListVC = ProfileInfoVC()
            self.navigationController?.pushViewController(profileInfoListVC, animated: true)
        }
    }
}

extension PizzaListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return menuItems.count
        }
        else {
            return pizzaViewModel.drinks.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Menu Items"
        } else {
            return "Drinks"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PizzaInfoTableViewCell.identifier, for: indexPath) as! PizzaInfoTableViewCell
            let menuItem = self.menuItems[indexPath.row]
            guard let imageUrl = menuItem.image else { return cell }
            pizzaViewModel.getProductImage(with: imageUrl) { itemImage in
                cell.configure(model: menuItem, image: itemImage)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: DrinksToGoTableViewCell.identifier, for: indexPath) as! DrinksToGoTableViewCell
            let drink = pizzaViewModel.drinks[indexPath.row]
            cell.configure(drink: drink)
            return cell
        }
    }
}

extension PizzaListVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let menuItem = self.menuItems[indexPath.item]
        print("1111-3", menuItem)
    }
}


extension PizzaListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pizzaViewModel.bannerImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertisementBannerCollectionCell.identifier, for: indexPath) as! AdvertisementBannerCollectionCell
        let bannerImage = pizzaViewModel.bannerImages[indexPath.row]
        cell.set(image: bannerImage ?? UIImage())
        return cell
    }
}

extension PizzaListVC: UICollectionViewDelegate {
    
    
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
