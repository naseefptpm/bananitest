//
//  TokenService.swift
//  bananitest
//
//  Created by codeteki private Ltd on 25/01/21.
//

import UIKit

class TokenService {
    
    static let tokenInstance = TokenService()
    let userDefault = UserDefaults.standard
    func saveToken(token: String) {
        userDefault.set(token, forKey: TokenKey.userlogin)
    }
    func getToken() -> String {
        if let token = userDefault.object(forKey: TokenKey.userlogin) as? String {
            return token
        }else {
            return ""
        }
    }
    func checkForLogin() -> Bool {
        if getToken() == "" {
            return false
        }else {
            return true
        }
        
    }
    func removeToken()  {
        userDefault.removeObject(forKey: TokenKey.userlogin)
    }
}
