//
//  RegisterModel.swift
//  bananitest
//
//  Created by codeteki private Ltd on 22/01/21.
//

import Foundation
struct RegisterModel: Encodable {
    let name: String
    let email: String
    let password: String
    
}

struct ResponseModel: Codable {
    let lastLogin: Int
    let userStatus: String
    let created: Int
    let ownerID, socialAccount, name, productModelClass: String
    let blUserLocale, userToken: String
    
    let email, objectID: String

    enum CodingKeys: String, CodingKey {
        case lastLogin, userStatus, created
        case ownerID = "ownerId"
        case socialAccount, name
        case productModelClass = "___class"
        case blUserLocale
        case userToken = "user-token"
        case email
        case objectID = "objectId"
    }
}
