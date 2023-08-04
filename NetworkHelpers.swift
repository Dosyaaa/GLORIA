//
//  NetworkHelpers.swift
//  GLORIA
//
//  Created by User on 3/8/23.
//

import UIKit

enum Constants {
    static let baseUrl = URL(string: "http://127.0.0.1:8000/api/v1/categories/")!
}

class API {
    static let id = API()
    
    func fetch(completion: @escaping (Catalog) -> ()) {
        let request = URLRequest(url: Constants.baseUrl)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error)
            }
            guard let data = data else { return }
            do {
                let character = try JSONDecoder().decode(Catalog.self, from: data)
                completion(character)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
