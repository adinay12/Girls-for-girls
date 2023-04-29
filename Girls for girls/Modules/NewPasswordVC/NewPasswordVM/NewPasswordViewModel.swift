//
//  NewPasswordViewModel.swift
//  Girls for girls
//
//  Created by Adinay on 29/3/23.
//

import Foundation

class NewPasswordViewModel {
    
    // MARK: Запрос на Токен Пароль и Подтвердите новый пароль
    
    func postResetToken(token: String, password: String,
                           confirmPass: String, completion: @escaping () -> Void) {
        let data = ["password": "\(password)",
                    "confirmPass":"\(confirmPass)"].toData()
        NetworkManager().sendRequest(urlRequest: ApiService.postResetToken(user: data, token: token).makeUrlRequest()) { response in
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
