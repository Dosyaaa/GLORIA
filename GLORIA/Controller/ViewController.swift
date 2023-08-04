//
//  ViewController.swift
//  GLORIA
//
//  Created by User on 31/7/23.
//

import UIKit

class ViewController: UIViewController {

    static let id = String(describing: ViewController.self)
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var vectorImage: UIImageView!
    @IBOutlet weak var catalogCollectionView: UICollectionView!
    @IBOutlet weak var catalogView: UIView!
    @IBOutlet weak var katalog: UILabel!
    @IBAction func backButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SubcategoriesViewController") as! SubcategoriesViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    var array: [Catalog] = [Catalog(name: "sdada"),Catalog(name: "dsdsd"),Catalog(name: "dsdsa"),Catalog(name: "dsadsad"),Catalog(name: "dsadsad"),Catalog(name: "dsads"),Catalog(name: "dsadsad"),Catalog(name: ""),Catalog(name: "dsadadad")]
//    var array: [Catalog] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        catalogCollectionView.showsVerticalScrollIndicator = false
        catalogCollectionView.delegate = self
        catalogCollectionView.dataSource = self
        catalogCollectionView.register(UINib(nibName: CatalogCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: CatalogCollectionViewCell.id)
//        API.id.fetch { results in
//            switch results {
//            case .success(let model):
//                self.array = model
//                DispatchQueue.main.async {
//                    self.catalogCollectionView.reloadData()
//                }
//            case .failure(let error):
//                self.showError(with: error)
//            }
//        }
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
                
        self.catalogView.layer.insertSublayer(gradientLayer, at:1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        catalogView.addSubview(katalog)
        super.viewWillAppear(animated)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 166, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductsCartViewController") as! ProductsCartViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCollectionViewCell.id, for: indexPath) as! CatalogCollectionViewCell
        let model = array[indexPath.row]
        cell.display(item: model)
        cell.layer.cornerRadius = 10
        return cell
    }
}
