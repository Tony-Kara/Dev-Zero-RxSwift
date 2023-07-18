//
//  Model.swift
//  H_TakeHome
//
//  Created by Tony-eniola on 6/24/23.
//

import Foundation

struct MenuItem: Decodable {
    let image: URL?
    let name, description, price : String
}
