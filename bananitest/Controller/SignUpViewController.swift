//
//  ViewController.swift
//  bananitest
//
//  Created by codeteki private Ltd on 22/01/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var fName: UITextField!
    
    @IBOutlet weak var lName: UITextField!
    
    @IBOutlet weak var emailtxt: UITextField!
    
    @IBOutlet weak var passwordtxt: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpPressed(_ sender: UIButton) {
        guard  let firstname = fName.text else {return }
        guard  let lastname = lName.text else {return }
        guard let email = emailtxt.text else {return }
        guard let password = passwordtxt.text else {return }
        let register = RegisterModel(name: firstname + lastname, email: email, password: password)
        
        APIManager.shareInstance.callingRegisterAPI(register: register)
        { (isSuccess, str) in
            if isSuccess {
                self.showAlertWith(title: "Sign UP", message: str)
            } else {
                self.showAlertWith(title: "Invalid", message: str)
            }
            
        }
        
    }
    
    func showAlertWith(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

