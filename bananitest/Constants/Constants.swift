//
//  Constants.swift
//  bananitest
//
//  Created by codeteki private Ltd on 22/01/21.
//

import Foundation
 
let app_id = "9C244444-8068-D426-FF7A-A1572FD42D00"
let rest_key = "B8A9550C-161E-482A-8BDF-69B14F89125A"
let base_url = "https://api.backendless.com/\(app_id)/\(rest_key)/users/"
let register_url = "\(base_url)register"
let login_url = "\(base_url)login"
let logout_url = "\(base_url)logout"


struct TokenKey {
    static let userlogin = "USER_LOGIN_KEY"
}

// https://api.backendless.com/9C244444-8068-D426-FF7A-A1572FD42D00/B8A9550C-161E-482A-8BDF-69B14F89125A/users/
