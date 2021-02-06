//
//  BananiBaseViewController.swift
//  bananitest
//
//  Created by codeteki private Ltd on 28/01/21.
//

import UIKit

class BananiBaseViewController: UIViewController, UIGestureRecognizerDelegate {
    let menuImage = UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal)
    var titleText:String? {
        didSet{
            self.navigationItem.title = titleText
        }
    }
    var swipeDisabled:Bool = false {
        didSet{
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = swipeDisabled
            self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        }
    }
    
    var hideBackButton:Bool = false {
        didSet{
            self.navigationItem.setHidesBackButton(hideBackButton, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = " "
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = swipeDisabled
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hideNavigationBar(_ shouldHide:Bool = true){
        self.navigationController?.isNavigationBarHidden = shouldHide
    }
    
    
    
 
    
    func showAlertWith(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return !self.swipeDisabled
    }
}
