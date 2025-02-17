//
//  LoginViewController.swift
//  Explora
//
//  Created by Gaurav Patel on 12/02/25.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Outlets.
    
    @IBOutlet weak var imgWelcomeBack: UIImageView!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnRememberMe: UIButton!
    
    @IBOutlet weak var btnNext: UIButton!
    

    // MARK: - DidLoad().
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnNext.layer.cornerRadius = 15
        btnNext.layer.masksToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func btnForgetPasswordTapped(_ sender: UIButton) {
    }
    
    // MARK: - Remember Me Button.
    
    @IBAction func btnRememberMeTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected

        if sender.isSelected {
            print("Selected Remember me button !")
            sender.setImage(UIImage(named: "btn-check"), for: .selected)
        } else {
            print("Unselected Remember me button !")
            sender.setImage(UIImage(named: "btn-uncheck"), for: .normal)
        }
    }
    
    // MARK: - Next Button Tapped
    
    @IBAction func btnNextPressed(_ sender: UIButton) {
        
        guard let email = txtEmail.text, !email.isEmpty else {
            let Alert = AlertManager.shared
            Alert.showAlert(on: self, title: "Empty Email!", message: "Please again enter email address.")
            return
        }
        
        if EmailValidator().isValidEmail(email) == false {
            let Alert = AlertManager.shared
            Alert.showAlert(on: self, title: "Invalid Email!", message: Constants.invalidEmail)
            return
        }
        
        guard let password = txtPassword.text, !password.isEmpty else {
            let alert = AlertManager.shared
            alert.showAlert(on: self, title: "Empty Password!", message: Constants.emptyPassword)
            return
        }

        guard password.count >= 8 else {
            let alert = AlertManager.shared
            alert.showAlert(on: self, title: "Password Too Short!", message: Constants.passwordError)
            return
        }
        
        print("Email: \(email), Password: \(password)")
        
        
        // All check passed now show welcome scene to user.
        let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.HomeVC) as! HomeViewController
        self.navigationController?.pushViewController(HomeVC, animated: true)

    }
    
    @IBAction func btnRegisterNowTapped(_ sender: UIButton) {
        let SignUpVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.SignUpVC) as! SignUpViewController
        
        self.navigationController?.pushViewController(SignUpVC, animated: true)
    }
    
}
