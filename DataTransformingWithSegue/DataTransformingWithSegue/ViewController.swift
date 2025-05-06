//
//  ViewController.swift
//  DataTransformingWithSegue
//
//  Created by Betül Ekren on 22.02.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    var userName = ""
    @IBAction func sendButton(_ sender: Any) {
        userName = textField.text ?? ""
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    
    @IBAction func goToSecondPage(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let destination = segue.destination as! SecondVC
            destination.takenName = userName
        }
       
    }
}

