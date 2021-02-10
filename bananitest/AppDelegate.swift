//
//  AppDelegate.swift
//  bananitest
//
//  Created by codeteki private Ltd on 22/01/21.
//

import UIKit
import DrawerMenu
import GoogleMaps
import GooglePlaces
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    public var drawerMenu:DrawerMenu? = nil

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        GMSServices.provideAPIKey("AIzaSyD7gl7LrxtbTjlplCXphN2EJi7HRi9s_8Y")
        GMSPlacesClient.provideAPIKey("AIzaSyD7gl7LrxtbTjlplCXphN2EJi7HRi9s_8Y")
        
        let vc: UIViewController?
        if TokenService.tokenInstance.checkForLogin() {
          //  print("You are Logged in")
            //vc = DashboardViewController.shareInstance()
            self.showTabbBar()
        }else {
            print("you are Logged Out")
            vc = WelcomeViewController.shareInstance()
        }
        
       
        
//        let naVC = UINavigationController(rootViewController: vc!)
//        window?.rootViewController = naVC
//        window?.makeKeyAndVisible()
        return true
    }

    func showTabbBar(){
        let story = UIStoryboard(name: "Dashboard", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }


}

