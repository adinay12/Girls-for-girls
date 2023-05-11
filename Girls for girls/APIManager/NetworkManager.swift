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
    static let shared = NetworkManager()
    
    func sendRequest <T: Decodable>(urlRequest: URLRequest, successModel: T.Type, completion: @escaping(ProResult<T>) -> Void) {
        AF.request(urlRequest).responseDecodable(of: successModel.self) { [weak self] response in
            let jsonData = response.data?.description.data(using: .utf8)
            switch response.result {
            case .success(let decodedModel):
                completion(.success(decodedModel))
            case .failure(let error):
                if response.response?.statusCode == 400 {
                    
                    guard let jsonData = jsonData else { return }
                    //                        let string = JSONDecoder().decode(Any.self, from: jsonData)
                    print(String(data: response.data!, encoding: .utf8))
                    //                        let failureModel = self?.decodeJson(data: response.data, decodeModel: String.self)
                    completion(.badrequest("bad request"))
                } else if response.response?.statusCode == StatusCode.unAuthorized.code {
                    completion(.unauthorized("access token is dead"))
                    // Fetch new access token
                } else {
                    completion(.failerror(error.localizedDescription))
                }
            }
        }
    }
    
    
    func sendRequest(urlRequest: URLRequest, completion: @escaping(ResponseResult) -> Void ) {
        AF.request(urlRequest).responseString { response in
            switch response.result {
            case .success(let sucessModel):
                completion(.success(sucessModel))
            case .failure(let error):
                if response.response?.statusCode == 400 {
                    
                    completion(.badrequest(error.localizedDescription))
                } else if response.response?.statusCode == StatusCode.unAuthorized.code {
                    completion(.unauthorized(error.localizedDescription))
                    // Fetch new access token
                } else {
                    completion(.failerror(error.localizedDescription))
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
    
    
    func fetchNilAccessToken(comletion: @escaping(RefreshTokenResult) -> Void) {
        sendRequest(urlRequest: ApiService.requestAccessToken(info: Data()).makeUrlRequest(), successModel: RefreshToken.self) { result in
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
