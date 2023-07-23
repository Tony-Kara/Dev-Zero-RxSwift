//
//  PizzaViewModel.swift
//  Dev-Zero-RxSwift
//
//  Created by Eniola Anthony on 7/18/23.
//

import Foundation
import UIKit

class PizzaViewModel {
    
    let apiService = ApiService()
    var menuItems: [MenuItem] = [MenuItem]()
    var bannerImages : [UIImage?] = [UIImage(named: "Banner1"), UIImage(named: "Banner2"), UIImage(named: "Banner3")]
    let drinks = [ "Pepsi", "Cola", "Sprite", "Ice Tea" ]
    
    
    var others = CategoryTypes(id: 0, menuType: .Others, category: "Others")
    var pizza: CategoryTypes?
    var combo: CategoryTypes?
    var beverage: CategoryTypes?
    var dessert: CategoryTypes?
    
    func loadMenuItems(_ completion: @escaping ([MenuItem]) -> Void) {
        apiService.getMenu { items in
            self.menuItems = items
            completion(items)
        }
    }
    
    func getProductImage(with url: URL,  _ completion: @escaping (UIImage) -> Void) {
        apiService.getImage(url: url) { productImage in
            completion(productImage)
        }
    }
}
