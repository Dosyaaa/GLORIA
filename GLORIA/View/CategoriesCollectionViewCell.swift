//
//  CategoriesCollectionViewCell.swift
//  GLORIA
//
//  Created by User on 31/7/23.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    static let id = String(describing: CategoriesCollectionViewCell.self)
    
    @IBOutlet weak var categoriesImage: UIImageView!
    
    func display(item: Categories) {
//        categoriesImage.getImage(item.image)
        categoriesImage.image = UIImage(named: item.image)
    }
}

struct Categories: Codable {
    var image: String
}

extension UIImageView {
    func getImage(_ path: String) {
            guard let url = URL(string: path) else { return }
            Task {
                let (data, _) = try await URLSession.shared.data(from: url)
                DispatchQueue.main.async {
                self.image = UIImage(data: data)
                }
            }
        }
}
