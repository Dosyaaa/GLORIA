//
//  CatalogCollectionViewCell.swift
//  GLORIA
//
//  Created by User on 31/7/23.
//

import UIKit

class CatalogCollectionViewCell: UICollectionViewCell {

    static var id = String(describing: CatalogCollectionViewCell.self)
    
    private var labels: Catalog?
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBAction func favouritesButton(_ sender: Any) {
    }
    @IBAction func basketButton(_ sender: Any) {
    }
    
    func display(item: Catalog) {
        productLabel.text = item.name
    }
}

struct Catalog: Codable {
    var name: String
}
struct Catalogs: Codable {
    var results: [Catalog]?
}

