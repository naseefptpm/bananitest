//
//  SideMenuController.swift
//  Shoppy
//
//  Created by codeteki private Ltd on 16/01/21.
//

import UIKit

protocol SideMenuDelegate {
    func didSelectIndex(index:Int)
}

class SideMenuController: UIViewController {
var namelabel = ""
    
    @IBOutlet weak var tblMenu: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    var delegate:SideMenuDelegate!
    
    var menuItem : [MenuItem] = [
        MenuItem(item: "Home"),
        MenuItem(item: "Profile"),
        MenuItem(item: "My Cart"),
        MenuItem(item: "Favourites"),
        MenuItem(item: "My Orders"),
        MenuItem(item: "Language"),
        MenuItem(item: "Settings"),
        MenuItem(item: "Logout")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMenu.dataSource = self
        tblMenu.tableFooterView = UIView()
        nameLbl.text = namelabel
        


        
            
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
 nameLbl.text = namelabel

    }
    


}

extension SideMenuController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return menuItem.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        cell.textLabel?.text = menuItem[indexPath.row].item
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if delegate != nil {
            delegate.didSelectIndex(index: indexPath.row)
           
        }
    }
    
    
}

struct MenuItem {
    let item : String
}
extension SideMenuController{

    static func shareInstance() -> SideMenuController {

        return UIStoryboard(name: "LeftMenu", bundle: nil).instantiateViewController(withIdentifier: "menuVC") as! SideMenuController
    }
}
