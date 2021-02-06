//
//  AddPropertyViewController.swift
//  bananitest
//
//  Created by codeteki private Ltd on 26/01/21.
//

import UIKit

class AddPropertyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddPropertyViewController{

    static func shareInstance() -> AddPropertyViewController {

        return UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "AddPropertyViewController") as! AddPropertyViewController
    }
}
