//
//  ViewController.swift
//  Explora
//
//  Created by Gaurav Patel on 11/02/25.
//

import UIKit

class WelcomeScreenOneVC: UIViewController {

    @IBOutlet weak var imgOne: UIImageView!
    @IBOutlet weak var lblExploreOne: UILabel!
    @IBOutlet weak var lblToDesireOne: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // if navigationController exists then hide it.
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    
    @IBAction func btnNextTapped(_ sender: UIButton) {
        let SecondVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.WSTwo) as! WelcomeScreenTwoVC
        
        self.navigationController?.pushViewController(SecondVC, animated: true)
    }
    
}

