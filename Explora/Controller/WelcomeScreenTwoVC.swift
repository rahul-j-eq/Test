//
//  WelcomeScreenTwoVC.swift
//  Explora
//
//  Created by Gaurav Patel on 12/02/25.
//

import UIKit

class WelcomeScreenTwoVC: UIViewController {
    
    // MARK: - Outlets.
    
    @IBOutlet weak var imgTwo: UIImageView!
    
    @IBOutlet weak var lblReachTwo: UILabel!
    
    @IBOutlet weak var lblDestinationTwo: UILabel!
    
    // MARK: - DidLoad().
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - On Next btn Press.
    
    @IBAction func btnNextTapped(_ sender: UIButton) {
        let ThirdVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.WSThree) as! WelcomeScreenThreeVC
        
        self.navigationController?.pushViewController(ThirdVC, animated: true)
    }
    
}
