//
//  PasswordRecoveryViewModel.swift
//  Girls for girls
//
//  Created by Adinay on 29/3/23.
//

import Foundation

class PasswordRecoveryViewModel {
    
    // MARK: Запрос на Восстановление Пароля
    
    var token = ""
    func getPasswordResert(token: String, completion: @escaping (String) -> Void) {
        NetworkManager().sendRequest(urlRequest: Register.postForgotEmail(email: token).makeUrlRequest()) { response in
            switch response {
            case .success(let string):
                print(string)
                self.token = string
                completion(string)
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
