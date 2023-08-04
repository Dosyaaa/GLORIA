//
//  ProductsCartViewController.swift
//  GLORIA
//
//  Created by User on 4/8/23.
//

import UIKit

class ProductsCartViewController: UIViewController {

    @IBOutlet weak var katalog: UILabel!
    @IBOutlet weak var prodsCartView: UIView!
    @IBOutlet weak var prodsCartName: UILabel!
    @IBOutlet weak var prodsCartPriceLabel: UILabel!
    @IBOutlet weak var prodsCartPrice: UILabel!
    @IBOutlet weak var prodsCartCount: UILabel!
    @IBOutlet weak var prodsCartImage: UIImageView!
    @IBOutlet weak var postCard: UILabel!
    @IBAction func backButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    @IBAction func choiceButton(_ sender: Any) {
        
    }
    @IBAction func basketButton(_ sender: Any) {
        
    }
    @IBOutlet weak var inscriptonTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 393, height: 84)
                
        self.prodsCartView.layer.insertSublayer(gradientLayer, at:1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        prodsCartView.addSubview(katalog)
        super.viewWillAppear(animated)
        
    }
}
