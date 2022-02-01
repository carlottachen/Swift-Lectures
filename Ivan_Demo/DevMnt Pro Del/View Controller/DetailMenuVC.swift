//
//  MenuVC.swift
//  DevMnt Pro Del
//
//  Created by Ivan Ramirez on 1/19/22.
//

import UIKit

protocol PlaceOrderProtocol: AnyObject {
    func addOrder()
}

class DetailMenuVC: UIViewController{
    
    @IBOutlet weak var pizzaImageView: UIImageView!
    @IBOutlet weak var prepTimeLabel: UILabel!
    @IBOutlet weak var calsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var cheeseLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    
    // landing pad to catch pizza details
    var pizza: Pizza?
    
    // declare the pizza delegate
    weak var pizzaDelegate: PlaceOrderProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        styleDismissButton()
    }
    
    func styleDismissButton() {
        dismissButton.setImage(UIImage(systemName: "x.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default)), for: .normal)
        dismissButton.tintColor = .systemPink
    }
    
    func updateViews() {
        guard let pizza = pizza else { return }
        
        nameLabel.text = pizza.name
        prepTimeLabel.text = "⏰ 10 - 15 min"
        cheeseLabel.text = pizza.cheeseType
        priceLabel.text = "💵 $\(pizza.price)"
        calsLabel.text = "🔥 \(pizza.cal)"
        descriptionLabel.text = "\(pizza.description)"
        pizzaImageView.image = UIImage(named: pizza.imageName)
        ratingLabel.text = "⭐️ \(pizza.rating)"
    }
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        // tapping on 'Add to cart' should increment count in cart
        pizzaDelegate?.addOrder()
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
