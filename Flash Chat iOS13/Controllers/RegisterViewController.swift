//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        //Define email and passwords with optional binding
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            //If successfull, calls createUser
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
              
                if let e = error { //If there was an error with the registration, throws an alert
                    let alert = UIAlertController(title: "Oops!", message: e.localizedDescription , preferredStyle: UIAlertController.Style.alert)
                    
                    alert.addAction(UIAlertAction(title: "Accept", style: UIAlertAction.Style.default, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)

                } else {//Registration successful 
                    
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
                
                
            }
            
            
        }
    }
    
}
