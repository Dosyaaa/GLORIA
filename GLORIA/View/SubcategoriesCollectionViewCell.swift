//
//  SubcategoriesCollectionViewCell.swift
//  GLORIA
//
//  Created by User on 3/8/23.
//

import UIKit

class SubcategoriesCollectionViewCell: UICollectionViewCell {

    static let id = String(describing: SubcategoriesCollectionViewCell.self)
    
    @IBOutlet weak var subProductsLabel: UILabel!
    @IBOutlet weak var subProductsImage: UIImageView!
    
    func display(item: Subcategories) {
        subProductsLabel.text = item.label
    }
}

struct Subcategories {
    var label: String
}
