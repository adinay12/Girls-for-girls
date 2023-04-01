//
//  EmailViewModel.swift
//  Girls for girls
//
//  Created by Adinay on 29/3/23.
//

import Foundation

class EmailViewModel {
  
    // MARK: Запрос на Забыли Пароль
    
    func postForgotEmail(email: String, completion: @escaping () -> Void) {
        NetworkManager().sendRequest(urlRequest: Register.postForgotEmail(email: email).makeUrlRequest()) { response in
            switch response {
            case .success(let string):
                print(string)
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

