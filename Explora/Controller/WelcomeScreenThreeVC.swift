//
//  WelcomeScreenThreeVC.swift
//  Explora
//
//  Created by Gaurav Patel on 12/02/25.
//

import UIKit

class WelcomeScreenThreeVC: UIViewController {
    
    // MARK: - Outlets.
    
    @IBOutlet weak var imgThree: UIImageView!
    
    @IBOutlet weak var lblPrimaryThree: UILabel!
    
    @IBOutlet weak var lblSecondaryThree: UILabel!
    
    
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
        let LoginVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.LoginVC) as! LoginViewController
        
        self.navigationController?.pushViewController(LoginVC, animated: true)
    }
    
}
