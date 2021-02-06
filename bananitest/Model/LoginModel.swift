//
//  LoginModel.swift
//  bananitest
//
//  Created by codeteki private Ltd on 22/01/21.
//

import UIKit

struct LoginModel: Encodable {
    let login: String
    let password: String
    
}

struct LoginResponseModel {
    let name: String
    let email: String 
    
}
