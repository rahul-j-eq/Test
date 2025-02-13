//
//  SignUpViewController.swift
//  Explora
//
//  Created by Gaurav Patel on 12/02/25.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var imgGetStarted: UIImageView!
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPhoneNumber: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func btnAgreeToTermsPressed(_ sender: Any) {
    }
    
    @IBAction func btnNextPressed(_ sender: UIButton) {
    }
    
    @IBAction func btnLoginPressed(_ sender: UIButton) {
    }
    
}
