//
//  ProfileSettingsViewModel.swift
//  Girls for girls
//
//  Created by Adinay on 17/4/23.
//

import Foundation


class ProfileSettingsViewModel {
    
    // MARK: - Запрос на Изменение Аккаунта
    
    func putChangeAccount(firstName: String,  lastName: String, phoneNumber: String,  region_id: String, completion: @escaping () -> Void) {
        let user = [ "firstName": "\(firstName)",
                     "lastName": "\(lastName)",
                     "phoneNumber": "\(phoneNumber)",
                     "region_id":"\(region_id)",].toData()
        NetworkManager().sendRequest(urlRequest: Register.сhangeAccount(user: user).makeUrlRequest()) { response in
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