//
//  ApplicationRootViewController.swift
//  Shoppy
//
//  Created by codeteki private Ltd on 13/01/21.
//

import DrawerMenu
import UIKit

class ApplicationRootViewController: BananiBaseViewController {
    var leftMenu:SideMenuController!
    var drawerMenu:DrawerMenu!
    override func viewDidLoad() {
        super.viewDidLoad()
        leftMenu = UIStoryboard(name: "LeftMenu", bundle: nil).instantiateInitialViewController() as? SideMenuController
        leftMenu.delegate = self
        let center = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(identifier: "DashboardViewController")
        drawerMenu = DrawerMenu(center: center, left: leftMenu)
        ((UIApplication .shared).delegate as! AppDelegate).drawerMenu = drawerMenu
        addChild(drawerMenu)
        view.addSubview(drawerMenu.view)
        drawerMenu.didMove(toParent: self)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.hideNavigationBar()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    //    func logoutUser() {
    //        // call from any screen
    //
    //        do { try Auth.auth().signOut() }
    //        catch { print("already logged out") }
    //
    //        navigationController?.popToRootViewController(animated: true)
    //    }
    
}
extension ApplicationRootViewController:SideMenuDelegate{
    func didSelectIndex(index: Int) {
        self.drawerMenu.close(to: .left)
        switch index {
        //        case 1:
        //            self.navigationController?.pushViewController(MyProfileViewController.profileVC(), animated: true)
        //        case 2:
        //            self.navigationController?.pushViewController(MyCartViewController.myCartVC(), animated: true)
        //        case 3:
        //            self.navigationController?.pushViewController(FavouriteViewController.favouriteVC(), animated: true)
        //        case 4:
        //            self.navigationController?.pushViewController(MyOrdersViewController.myOrderVC(), animated: true)
        //        case 5:
        //            self.navigationController?.pushViewController(LanguageViewController.languageVC(), animated: true)
        //        case 6:
        //            self.navigationController?.pushViewController(SettingsViewController.settingsVC(), animated: true)
        case 7:
            APIManager.shareInstance.callingLogoutAPI(vc: self)
        default:
            self.drawerMenu.close(to: .left)
            
        }
    }
    
    
}
