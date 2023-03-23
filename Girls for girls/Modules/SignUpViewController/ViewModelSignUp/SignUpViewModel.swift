//
//  SignUpViewModel.swift
//  Girls for girls
//
//  Created by Adinay on 19/3/23.
//

import Foundation

//protocol SignUpViewModelProtocol {
//}
// MARK:  Будет отвечать за логику LoginViewController

class SignUpViewModel {
    
    func registerUser() {
        let data = ["email": "asjumalieva@gmail.com",
                    "firstName": "Asel",
                    "lastName": "Zhumalieva",
                    "password": "1234",
                    "confirmPass": "1234",
                    "placeOfBirth": "Bishkek",
                    "phoneNumber": "0700771239"].toData()
        NetworkManager().sendRequest(urlRequest: Register.registerUser(user: data).makeUrlRequest(), succesModel: String.self) { result in
            switch result {
            case .success(let model):
                print(model)
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
        
