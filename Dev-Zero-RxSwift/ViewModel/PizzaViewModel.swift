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
//    init() {
//        loadMenuItems()
//        print("1111-4", self.menuItems)
//    }
    
     func loadMenuItems(_ completion: @escaping ([MenuItem]) -> Void) {
        apiService.getMenu { items in
            self.menuItems = items
            completion(items)
            print("1111-4", self.menuItems)
        }
    }
    
     func getProductImage(with url: URL,  _ completion: @escaping (UIImage) -> Void) {
         apiService.getImage(url: url) { productImage in
             completion(productImage)
         }
     }
    
}
