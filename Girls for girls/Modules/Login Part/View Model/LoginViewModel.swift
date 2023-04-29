//
//  LoginViewModel.swift
//  Girls for girls
//
//  Created by Adinay on 13/2/23.
// Будет отвечать за логику LoginViewController

import UIKit
class LoginViewModel {
    
//    var isUserAuthorized: ((Bool) -> Void)?   // замыкания
    
    // MARK: - Запрос на Авторизацию
    
    func authorizationUser(email: String, password: String, completion: @escaping ()->Void) {
        let data = ["email": "\(email)",
                    "password": "\(password)"].toData()
        NetworkManager().sendRequest(urlRequest: ApiService.loginUser(user: data).makeUrlRequest(), successModel: LoginResponse.self) { result in
            switch result {
            case .success(let model):
                print(model)
                DSGenerator.sharedInstance.setAccessToken(model.accessToken)
                DSGenerator.sharedInstance.setRefreshToken(model.refreshToken)
                completion()
            case .unauthorized(let string):
                print(string)
            case .forebidden(let string):
                print(string)
            case .notfound(let string):
                print(string)
            case .badrequest(let string):
                print(string)
            case .failerror(let string):
                print(string)
            }
        }
    }
}
