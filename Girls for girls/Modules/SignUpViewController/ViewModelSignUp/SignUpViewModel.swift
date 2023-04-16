//
//  SignUpViewModel.swift
//  Girls for girls
//
//  Created by Adinay on 19/3/23.
//

import Foundation
class SignUpViewModel {
    
    // MARK: Запрос на Регистрацию
    
    func registerUser(email: String, firstName: String, lastName: String, password: String, confirmPass: String, region_id: String, phoneNumber: String, completion: @escaping ()->Void ) {
        let data = ["email":"\(email)",
                    "firstName":"\(firstName)",
                    "lastName": "\(lastName)",
                    "password": "\(password)",
                    "confirmPass": "\(confirmPass)",
                    "region_id": "\(region_id)",
                    "phoneNumber": "\(phoneNumber)"].toData()
        NetworkManager().sendRequest(urlRequest: Register.registerUser(user: data).makeUrlRequest()) { response in
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
        




//class SignUpViewModel {
//    
//    // MARK: Запрос на Регистрацию
//    
//    func registerUser(email: String, firstName: String, lastName: String, password: String, confirmPass: String, placeOfBirth: String, phoneNumber: String, completion: @escaping ()->Void ) {
//        let data = ["email":"\(email)",
//                    "firstName":"\(firstName)",
//                    "lastName": "\(lastName)",
//                    "password": "\(password)",
//                    "confirmPass": "\(confirmPass)",
//                    "placeOfBirth": "\(placeOfBirth)",
//                    "phoneNumber": "\(phoneNumber)"].toData()
//        NetworkManager().sendRequest(urlRequest: Register.registerUser(user: data).makeUrlRequest(), succesModel: ResponseModel.self) { result in
//            switch result {
//            case .success(let model):
//                print(model)
//                completion()
//            case .unauthorized(let string):
//                print(string)
//            case .forebidden(let string):
//                print(string)
//            case .notfound(let string):
//                print(string)
//            case .badrequest(let string):
//                print(string)
//            case .failerror(let string):
//                print(string)
//            }
//        }
//    }
//}
