//
//  APIManager.swift
//  bananitest
//
//  Created by codeteki private Ltd on 22/01/21.
//

import Foundation
import Alamofire
import UIKit
enum APIErrors: Error {
    case custom(message: String)
}
typealias Handler = (Swift.Result<Any?, APIErrors>) -> Void

class APIManager {
    
  static  let shareInstance = APIManager()
    
    
    func callingRegisterAPI(register: RegisterModel, completionHandler: @escaping (Bool, String) -> ()) {
        let headers: HTTPHeaders = [.contentType("application/json")]
        
        AF.request(register_url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])

                    if response.response?.statusCode == 200 {
                        completionHandler(true, "Registered Successfully")
                    } else {
                        completionHandler(false, "Registration Failed")
                    }
                    
                } catch  {
                    
                }
                
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(false, "Registration Failed")

            }
        }
    }
    
    func callingLoginAPI(login: LoginModel, completionHandler: @escaping Handler) {
        let headers: HTTPHeaders = [.contentType("application/json")]
        
        AF.request(login_url, method: .post, parameters: login, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(ResponseModel.self, from: data!)
                    print(json)
                    
//                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
//
                    if response.response?.statusCode == 200 {
                        completionHandler(.success(json))
                    } else {
                        completionHandler(.failure(.custom(message: "please check ypur network connectivity")))
                    }
                    
                } catch  {
                    print(error.localizedDescription)
                    completionHandler(.failure(.custom(message: "please try again")))
                }
                
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(.failure(.custom(message: "please check ypur network connectivity")))

            }
        }
    }
    
    func callingLogoutAPI(vc: UIViewController)  {
        let headers: HTTPHeaders = [
            "user-token": "\(TokenService.tokenInstance.getToken)"
        ]
        AF.request(logout_url, method: .get,  headers: headers).response {
            response in
            
            switch response.result{
            case .success(_):
                
                TokenService.tokenInstance.removeToken()
                vc.navigationController?.popToRootViewController(animated: true)
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        }
    }
    
}
