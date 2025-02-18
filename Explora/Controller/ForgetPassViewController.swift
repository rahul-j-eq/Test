//
//  ForgetPassViewController.swift
//  Explora
//
//  Created by Gaurav Patel on 18/02/25.
//

import UIKit

class ForgetPassViewController: UIViewController {

    @IBOutlet weak var imgForgetPass: UIImageView!
    
    @IBOutlet weak var txtNewPassword: UITextField!
    
    @IBOutlet weak var txtConfirmPass: UITextField!
    
    @IBOutlet weak var btnConfirm: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnConfirm.layer.cornerRadius = 10
        btnConfirm.layer.masksToBounds = true
    }
    
    @IBAction func btnConfirmTapped(_ sender: UIButton) {
        // txtNewPassword & txtConfirmPass is same or not if not then Alert to user
    }
    

}
