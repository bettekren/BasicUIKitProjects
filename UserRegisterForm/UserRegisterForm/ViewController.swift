//
//  ViewController.swift
//  UserRegisterForm
//
//  Created by Betül Ekren on 24.02.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordAgain: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        if usernameTextField.text?.isEmpty == true {
            alertFunction(title: "Warning", message: "Your username is not entered", preferredStyle: .actionSheet)
        } else if passwordTextField.text?.isEmpty == true{
            alertFunction(title: "Warning", message: "Your password is not entered", preferredStyle: .alert)
        }
        else if passwordTextField.text != passwordAgain.text {
            alertFunction(title: "Warning", message: "Your password is not same", preferredStyle: .alert)
        
        } else {
            alertFunction(title: "Successful", message: "Log in is successful", preferredStyle: .alert)
           
            
            
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func alertFunction(title : String, message : String, preferredStyle : UIAlertController.Style){
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let okButton = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
        
        
    }


}

