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
    private lazy var pizzaViewModel = PizzaViewModel()
    
    private lazy var menuItems = [MenuItem]()  {
        didSet {
            DispatchQueue.main.async {
                self.rootView.tableView.reloadData()
            }
            loadCategoryItems()
        }
    }
    
    private lazy var allCartegoryTypes = [CategoryTypes]() {
        didSet {
            DispatchQueue.main.async {
                self.rootView.menuCatergoryCollectionView.reloadData()
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
        loadMenuItems()
        rootView.delegate = self
       
        rootView.tableView.register(PizzaInfoTableViewCell.self, forCellReuseIdentifier: PizzaInfoTableViewCell.identifier)
        rootView.tableView.register(DrinksToGoTableViewCell.self, forCellReuseIdentifier: DrinksToGoTableViewCell.identifier)
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
        
        rootView.bannerViewCollection.register(AdvertisementBannerCollectionCell.self, forCellWithReuseIdentifier: AdvertisementBannerCollectionCell.identifier)
        rootView.bannerViewCollection.dataSource = self
        rootView.bannerViewCollection.delegate = self
        
        rootView.menuCatergoryCollectionView.register(MenuCatergoryCell.self, forCellWithReuseIdentifier: MenuCatergoryCell.identifier)
        rootView.menuCatergoryCollectionView.dataSource = self
        rootView.menuCatergoryCollectionView.delegate = self
    }
    
    private func loadMenuItems() {
        pizzaViewModel.loadMenuItems { items in
            self.menuItems = items
        }
    }
    
    private func loadCategoryItems() {
        if !self.menuItems.isEmpty {
            for menuItem in menuItems {
                if menuItem.category == .beverage {
                    let beverage = CategoryTypes(id: 1, menuType: .Beverage, category: menuItem.category.rawValue)
                    pizzaViewModel.beverage = beverage
                }
                
                if menuItem.category == .combo {
                    let combo = CategoryTypes(id: 2, menuType: .Combo, category: menuItem.category.rawValue)
                    pizzaViewModel.combo = combo
                    
                }
                
                if menuItem.category == .dessert {
                    let dessert = CategoryTypes(id: 3, menuType: .Dessert, category: menuItem.category.rawValue)
                    pizzaViewModel.dessert = dessert
                    
                }
                
                if menuItem.category == .pizza {
                    let pizza = CategoryTypes(id: 4, menuType: .Pizza, category: menuItem.category.rawValue)
                    pizzaViewModel.pizza = pizza
                }
            }
            if let pizza = pizzaViewModel.pizza {
                allCartegoryTypes.append(pizza)
            }
            
            if let combo = pizzaViewModel.combo {
                allCartegoryTypes.append(combo)
            }
            
            if let beverage = pizzaViewModel.beverage {
                allCartegoryTypes.append(beverage)
            }
            
            if let dessert = pizzaViewModel.dessert {
                allCartegoryTypes.append(dessert)
            }
            
            allCartegoryTypes.append(pizzaViewModel.others)
            
            sort(selectedCategory: pizzaViewModel.others)
        }
    }
    
    private func sort(selectedCategory: CategoryTypes) {
    //    selectCategory(selectedCategory)
    }
    
    private func selectCategory(_ selectedCategory: CategoryTypes) {
        let indexPath: IndexPath = IndexPath(row: selectedCategory.id, section: 0)
        guard indexPath.row < rootView.menuCatergoryCollectionView.numberOfItems(inSection: indexPath.section) else {return}

        rootView.menuCatergoryCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: .top)
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
    }
}


extension PizzaListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == rootView.bannerViewCollection {
           return pizzaViewModel.bannerImages.count
        }
        
        else {
            return allCartegoryTypes.count
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == rootView.bannerViewCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertisementBannerCollectionCell.identifier, for: indexPath) as! AdvertisementBannerCollectionCell
            let bannerImage = pizzaViewModel.bannerImages[indexPath.row]
            cell.set(image: bannerImage ?? UIImage())
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCatergoryCell.identifier, for: indexPath) as! MenuCatergoryCell
            let categoryItems = allCartegoryTypes[indexPath.row]
            cell.insertData(categoryType: categoryItems)
            return cell
        }
        
        
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
