//
//  ChangePasswordViewModel.swift
//  Girls for girls
//
//  Created by Adinay on 25/4/23.
//

import Foundation

class ChangePasswordViewModel {
    
    // MARK: - Запрос на изменение пароля
    
    func userPasswordChange(email: String, oldPassword: String, newPassword: String, confirmNewPassword: String, completion: @escaping ()->Void ) {
        let passwords = ["email": "\(email)",
                         "oldPassword":"\(oldPassword)",
                         "newPassword":"\(newPassword)",
                         "confirmNewPassword":"\(confirmNewPassword)"].toData()
        NetworkManager().sendRequest(urlRequest: ApiService.сhangePassword(password: passwords).makeUrlRequest()) { result in
            switch result {
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
