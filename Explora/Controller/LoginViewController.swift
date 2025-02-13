//
//  LoginViewController.swift
//  Explora
//
//  Created by Gaurav Patel on 12/02/25.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var imgWelcomeBack: UIImageView!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnRememberMe: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func btnForgetPasswordTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func btnNextPressed(_ sender: UIButton) {
        
        guard let email = txtEmail.text, !email.isEmpty else {
            let Alert = AlertManager.shared
            Alert.showAlert(on: self, title: "Empty Email!", message: "Please again enter email address.")
            return
        }
        
        if EmailValidator().isValidEmail(email) == false {
            let Alert = AlertManager.shared
            Alert.showAlert(on: self, title: "Invalid Email!", message: "Please enter a valid email address.")
            return
        }
        
        guard let password = txtPassword.text, !password.isEmpty else {
            let Alert = AlertManager.shared
            Alert.showAlert(on: self, title: "Empty Password!", message: "Password field is empty. Please enter a password.")
            return
        }
        
        print("Email: \(email), Password: \(password)")
        // All check passed now show welcome scene to user.
        let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.HomeVC) as! HomeViewController
        self.navigationController?.pushViewController(HomeVC, animated: true)

    }
    
    @IBAction func btnRegisterNowTapped(_ sender: UIButton) {
    }
    
    
}
