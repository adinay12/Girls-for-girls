//
//  VerificationViewModel.swift
//  Girls for girls
//
//  Created by Adinay on 24/3/23.

import Foundation

class VerificationViewModel {

    // MARK: Запрос на Верификацию
    
    var token = ""
    func getActiveToken(token: String, completion: @escaping (String) -> Void) {
        NetworkManager().sendRequest(urlRequest:
            Register.getActiveToken(token: token).makeUrlRequest()) { response
            in
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





//class VerificationViewModel {
//
//    // MARK: Запрос на Верификацию
//    
//    func getActiveToken(token: String, completion: @escaping () -> Void) {
//        let token = "1234"
//        NetworkManager().sendRequest(urlRequest: Register.getActiveToken(token: token ).makeUrlRequest(), succesModel: String.self) { result in
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
