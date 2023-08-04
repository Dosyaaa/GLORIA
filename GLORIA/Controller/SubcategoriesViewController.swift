//
//  SubcategoriesViewController.swift
//  GLORIA
//
//  Created by User on 3/8/23.
//

import UIKit

class SubcategoriesViewController: UIViewController {

    static let id = String(describing: SubcategoriesViewController.self)
    @IBOutlet weak var subcatergoriesCollectionView: UICollectionView!
    @IBOutlet weak var subcatergoriesSearchBar: UISearchBar!
    @IBOutlet weak var subcategoriesView: UIView!
    @IBOutlet weak var katalog: UILabel!
    @IBAction func backButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CategoriesViewController") as! CategoriesViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
        print("tap")
    }
    
    var subCat: [Subcategories] = [Subcategories(label: "dsadsads"),Subcategories(label: "dsadsads"),Subcategories(label: "dsadsads"),Subcategories(label: "dsadsads"),Subcategories(label: "dsadsads"),Subcategories(label: "dsadsads"),Subcategories(label: "dsadsads"),Subcategories(label: "dsadsads"),Subcategories(label: "dsadsads"),Subcategories(label: "dsadsads"),Subcategories(label: "dsadsads"),Subcategories(label: "dsadsads")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subcatergoriesCollectionView.delegate = self
        subcatergoriesCollectionView.dataSource = self
        subcatergoriesCollectionView.register(UINib(nibName: SubcategoriesCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: SubcategoriesCollectionViewCell.id)
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
                
        self.subcategoriesView.layer.insertSublayer(gradientLayer, at:1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        subcategoriesView.addSubview(katalog)
        super.viewWillAppear(animated)
        
    }
    
}

extension SubcategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubcategoriesCollectionViewCell.id, for: indexPath) as! SubcategoriesCollectionViewCell
        let model = subCat[indexPath.row]
        cell.display(item: model)
        cell.layer.cornerRadius = 10
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        subCat.count
    }
}

extension SubcategoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 350, height: 70)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}
