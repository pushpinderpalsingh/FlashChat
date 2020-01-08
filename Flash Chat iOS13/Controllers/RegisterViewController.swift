//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
import PopupDialog

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail:email, password: password) { authResult, error in
                if let e = error {
                    let message = e.localizedDescription
                    let popup = PopupDialog(title: "Renter Password", message: message)
                    let button = CancelButton(title: "Ok", action: nil)
                    popup.addButton(button)
                    self.present(popup, animated: true, completion: nil)
                } else {
                    //Navigate to the chat
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
        
    }
    
}
