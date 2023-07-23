//
//  Model.swift
//  H_TakeHome
//
//  Created by Tony-eniola on 6/24/23.
//

import Foundation

struct MenuItem: Codable {
    let image: URL?
    let name, description, price : String
    let category: Category
    
}

enum Category: String, Codable {
    case pizza = "Pizza"
    case combo = "Combo"
    case beverage = "Beverage"
    case dessert = "Dessert"
    case others = "Others"
}

class CategoryTypes {
    let id: Int
    let menuType: MenuType?
    let category: String
    let isSelected: Bool
    
    init(id: Int, menuType: MenuType?, category: String, isSelected: Bool) {
        self.id = id
        self.menuType = menuType
        self.category = category
        self.isSelected = isSelected
    }
}

enum MenuType: CaseIterable {
    case Pizza, Combo, Beverage , Dessert, Others
    
    var icon: String? {
        switch self {
        case .Combo:
            return  "c.square"
        case .Beverage:
            return "cup.and.saucer.fill"
        case .Dessert:
            return "d.square"
        case .Others:
            return ""
        case .Pizza:
            return "flame"
        }
    }
    
    var title: String {
        switch self {
            
        case .Pizza:
            return "Pizza"
        case .Combo:
            return "Combo"
        case .Beverage:
            return "Beverage"
        case .Dessert:
            return "Dessert"
        case .Others:
            return "Others"
        }
    }
}
