//
//  PizzaVC.swift
//  DevMnt Pro Del
//
//  Created by Ivan Ramirez on 1/19/22.
//

import UIKit

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, PlaceOrderProtocol {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    private let pizzaData = PizzaData()
    var tally: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self    //this is the section on the view called 'myCollectionView'
        myCollectionView.dataSource = self
    }
    
    func addOrder() {
        tally += 1
        DispatchQueue.main.async {  // make it happen immediately
            self.totalLabel.text = "\(self.tally)"
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // keyword return is optional since there's only one line of code here
        return pizzaData.pizzas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // What's in each cell? Returns an empty UICollectionViewCell if there's nothing to return
        // ItemCVCell is the class that pizzaCell points to
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pizzaCell", for: indexPath) as? ItemCVCell else { return UICollectionViewCell() }
        
        // index of pizzas
        let pizzaOptions = pizzaData.pizzas[indexPath.row]
        // link to landing pad in ItemCVCell
        // cell has access to pizza because it is a type of ItemCVCell class
        cell.pizza = pizzaOptions
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVCDetail = segue.destination as? DetailMenuVC, // pass data to DetailMenuVC
              let cell = sender as? ItemCVCell, // cell that we click on belongs to ItemCVCell
              // index path
                let indexPath = self.myCollectionView.indexPath(for: cell) else { return }
        let pizzaOptions = pizzaData.pizzas[indexPath.row]
        destinationVCDetail.pizza = pizzaOptions
        
        //Need to assign delegate to our VC
        destinationVCDetail.pizzaDelegate = self
    }
    
    // MARK: - Animation
    func animateAstroDude(myImageView: UIImageView) {
        let originalCenter = myImageView.center
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                myImageView.center.x -= 80.0
                myImageView.center.y += 10.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.4) {
                myImageView.transform = CGAffineTransform(rotationAngle: -.pi / 80)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                myImageView.center.x -= 100.0
                myImageView.center.y += 50.0
                myImageView.alpha = 0.0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.51, relativeDuration: 0.01) {
                myImageView.transform = .identity
                myImageView.center = CGPoint(x:  900.0, y: 100.0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.55, relativeDuration: 0.45) {
                myImageView.center = originalCenter
                myImageView.alpha = 1.0
            }
            
        }, completion: { (_) in
        })
    }
    
    
    // MARK: - Action
    @IBAction func orderButtonTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.totalLabel.text = "0"
            self.animateAstroDude(myImageView: self.logoImageView)
        }
    }
    
}
