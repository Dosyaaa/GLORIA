//
//  CategoriesViewController.swift
//  GLORIA
//
//  Created by User on 31/7/23.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var categoriesSearchBar: UISearchBar!
    @IBOutlet weak var categoriesView: UIView!
    @IBOutlet weak var katalog: UILabel!
    var catalogs: [Catalog] = []
    
    
    var images: [Categories] = [Categories(image: "2"),Categories(image: "2"),Categories(image: "2"),Categories(image: "2"),Categories(image: "2"),Categories(image: "2")]
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(UINib(nibName: CategoriesCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: CategoriesCollectionViewCell.id)
        categoriesView.backgroundColor = .systemIndigo
        
    }
    
    func setGradientBackground() {
        let colorLeft =  UIColor(red: 0.33, green: 0.13, blue: 0.50, alpha: 1.00).cgColor
        let colorRight = UIColor(red: 0.64, green: 0.07, blue: 0.55, alpha: 1.00).cgColor
        let color = UIColor(red: 0.76, green: 0.09, blue: 0.52, alpha: 1.00).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorLeft, colorRight,color]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 393, height: 136)
                
        self.categoriesView.layer.insertSublayer(gradientLayer, at:1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        categoriesView.addSubview(katalog)
        super.viewWillAppear(animated)
    }
}



extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 170, height: 190)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let next = storyboard?.instantiateViewController(withIdentifier: "SubcategoriesViewController") as! SubcategoriesViewController
        next.modalPresentationStyle = .fullScreen
        present(next, animated: false)
    }
}

extension CategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.id, for: indexPath) as! CategoriesCollectionViewCell
        let model = images[indexPath.row]
        cell.display(item: model)
        cell.backgroundColor = .purple
        cell.layer.cornerRadius = 10
        return cell
    }
}
