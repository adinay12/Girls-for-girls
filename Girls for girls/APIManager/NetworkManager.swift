//
//  NetworkManager.swift
//  Girls for girls
//
//  Created by Adinay on 21/3/23.
//

import Foundation
import Alamofire
import SwiftUI

class NetworkManager {
    
    func sendRequest <T: Decodable>(urlRequest: URLRequest, succesModel: T.Type, comletion: @escaping(ProResuls<T>) -> Void) {
        AF.request(urlRequest).responseDecodable(of: succesModel.self) { [weak self] response in
            let data = response.data
            if let error = self?.bazaDateError(data: data, response: response.response, error: response.error) {
                if case NetworkErrors.unauthorized = error {
                    comletion(.unauthorized("Токен умер"))
                    self?.fitchNillAssessToken { response in
                        switch response {
                        case .success:
                            self?.sendRequest(urlRequest: urlRequest, succesModel: succesModel) { response in
                                switch response {
                                    
                                case .success(let model):
                                    comletion(.success(model))
                                case .unauthorized(_):
                                    comletion(.unauthorized("Неавторизован"))
                                case .forebidden(_):
                                    comletion(.forebidden("Неавторизован"))
                                case .notfound(_):
                                    comletion(.notfound("Не найден"))
                                case .badrequest(_):
                                    comletion(.badrequest("Не правильный запрос на сервер"))
                                case .failerror(_):
                                    comletion(.failerror("Что то пошло не так"))
                                }
                            }
                        case .failError:
                            comletion(.failerror("Что то пошло не так"))
                        }
                    }
                }
                
                else if case NetworkErrors.badRequest = error {
                comletion(.badrequest("bad request"))
                }
                
                else if case NetworkErrors.notFound = error {
                    comletion(.notfound("Не найден"))
                }
                
                else if let success = self?.decodeJson(data: data, decodeModel: T.self) {
                    DispatchQueue.main.async {
                        comletion(.success(success))
                    }
                }
            }
        }
    }
    
    
    private func decodeJson<T: Decodable>(data: Data?, decodeModel: T.Type) ->T? {
        guard let data = data else {
            return nil
        }
        
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    private func bazaDateError(data: Data?, response: URLResponse?, error: Error?) -> Error? {
        if let error = error {
            return error
        }
        
        guard let response = response as? HTTPURLResponse else {
            return URLError (.badServerResponse)
        }
        
        switch response.statusCode {
        case 200...210: return nil
        case 401:
            return NetworkErrors.unauthorized
        case StatusCode.badRequest.code:
            return NetworkErrors.badRequest
        case StatusCode.forebidden.code:
            return NetworkErrors.forbidden
        default:
            return nil
        }
    }
    
}


extension NetworkManager {
    
    enum RefreshTokenResult {
        case success
        case failError
    }
    
    func fitchNillAssessToken(comletion: @escaping(RefreshTokenResult) -> Void) {
        
        //     Из userDefaults должна полуить refreshToken и добавить его в body запрос
        //         "userId": 0
        //          "accessToken": "string",
        //         "refreshToken": "string"
        
        sendRequest(urlRequest: Register.requestAccessToken(info: Data()).makeUrlRequest(), succesModel: RefreshToken.self) { result in
            switch result {
            case .unauthorized(_):
                comletion(.failError)
            case .forebidden(_):
                comletion(.failError)
            case .success(_):
                comletion(.failError)
            case .notfound(_):
                comletion(.failError)
            case .badrequest(_):
                comletion(.failError)
            case .failerror(_):
                comletion(.failError)
            }
        }
    }
}

//case success(M)
//case unauthorized(String)
//case forebidden(String)
//case notfound(String)
//case badrequest(String)
//case failerror(String)

//
//case .success(let model):
//    //    UserDefaults сохранить новый successToken
//    //                model.accessToken
//    comletion(.success)
//case .unauthorized("Токен умер"):
//    comletion(.failError)
//case .forebidden("Неавторизован"):
//    comletion(.failError)
//case .notfound(_):
//    comletion(.failError)
//case .badrequest(_):
//    comletion(.failError)
//case .failerror(_):
//    comletion(.failError)
