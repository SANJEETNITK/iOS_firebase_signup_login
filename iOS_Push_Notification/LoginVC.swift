//
//  LoginVC.swift
//  iOS_Push_Notification
//
//  Created by Sanjeet Kumar on 06/09/21.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginClick(_ sender: Any) {
        
        guard let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password){
            authResult, error in
            
            guard let authResult = authResult, error == nil else{
                print("Please enter valid email and password")
                return
            }
            guard let logoutVC = self.storyboard?.instantiateViewController(identifier: "LogOutVC") as? LogOutVC else {
                return
            }
            self.navigationController?.pushViewController(logoutVC, animated: true)
        }
 
        
4    }
    
    @IBAction func goToSignUpClick(_ sender: Any) {
    }
}
