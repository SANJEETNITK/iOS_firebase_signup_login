//
//  ViewController.swift
//  iOS_Push_Notification
//
//  Created by Sanjeet Kumar on 06/09/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpClick(_ sender: Any) {
        
        guard let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){
            authResult, error in
            if let _ = error {
                print("Error occured while signing the user")
                return
            }
            print(authResult)
        }
        
        
        guard let logoutVC = self.storyboard?.instantiateViewController(identifier: "LogOutVC") as? LogOutVC else {
            return
        }
        
        self.navigationController?.pushViewController(logoutVC, animated: true)
        
    }
    
    @IBAction func goToLoginClick(_ sender: Any) {
        let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginVC") as? LoginVC
        self.navigationController?.pushViewController(loginVC!, animated: true)
    }
}
