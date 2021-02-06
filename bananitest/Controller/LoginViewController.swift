//
//  LoginViewController.swift
//  bananitest
//
//  Created by codeteki private Ltd on 22/01/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailtxt: UITextField!
    
    @IBOutlet weak var passwordtxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
        guard let email = emailtxt.text else {
            return
        }
        guard let password = passwordtxt.text else {
            return
        }
        
        let modelLogin = LoginModel(login: email, password: password)
        APIManager.shareInstance.callingLoginAPI(login: modelLogin) { (result) in
            switch result{
            case .success(let json):
                print(json)
                let email = (json as! ResponseModel).email
                let name = (json as! ResponseModel).name
                let userToken = (json as! ResponseModel).userToken
                TokenService.tokenInstance.saveToken(token: userToken)
                let sidemenuVC = SideMenuController.shareInstance()
                sidemenuVC.namelabel = name
                let dashboardVC = DashboardViewController.shareInstance()
                dashboardVC.strName = name
                print(name)
                print("user name is:\(name)")
               //self.navigationController?.pushViewController(dashboardVC, animated: true)
                self.showTabbBar()
                print(email)
                print(name)
//                print(json as AnyObject)
//                let email = (json as AnyObject).value(forKey: "email") as! String
//                let name = (json as AnyObject).value(forKey: "name") as! String
//                let modelLoginResponse = LoginResponseModel(name: name, email: email)
//                print(modelLoginResponse)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func showTabbBar(){
        let story = UIStoryboard(name: "Dashboard", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
}
