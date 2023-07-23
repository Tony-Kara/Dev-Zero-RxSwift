//
//  ApiService.swift
//  H_TakeHome
//
//  Created by Tony-eniola on 6/24/23.
//

import UIKit

protocol ApiNetworkingService {
    func getMenu(_ completion: @escaping ([MenuItem]) -> ())
    func getImage(url:URL, _ completion: @escaping (UIImage) -> Void)
}

final class ApiService: ApiNetworkingService {
    
    let session = URLSession.shared
    func getMenu(_ completion: @escaping ([MenuItem]) -> ()) {
        let request = URLRequest(url: URL(string: "https://api.npoint.io/a425e12999c51acc8696")!)
        let task = session.dataTask(with: request) { data, _, _ in
            DispatchQueue.main.async {
                guard let data = data,
                      let response =  try? JSONDecoder().decode([MenuItem].self, from: data)
                else {
                    completion([])
                    return
                }
                completion(response)
            }
        }
        task.resume()
    }
    
    func getImage(url: URL, _ completion: @escaping (UIImage) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            if let image = UIImage(data: data) {
                completion(image)
            }
        }.resume()
    }
}
