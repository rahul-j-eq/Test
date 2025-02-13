//
//  WelcomeScreenThreeVC.swift
//  Explora
//
//  Created by Gaurav Patel on 12/02/25.
//

import UIKit

class WelcomeScreenThreeVC: UIViewController {

    @IBOutlet weak var imgThree: UIImageView!
    
    @IBOutlet weak var lblPrimaryThree: UILabel!
    
    @IBOutlet weak var lblSecondaryThree: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func btnNextTapped(_ sender: UIButton) {
    }
    
}
