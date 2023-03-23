//
//  Register.swift
//  Girls for girls
//
//  Created by Adinay on 21/3/23.
//

import Foundation

enum Register: BaseRouterProtocol {
    case registerUser(user: Data)
    case loginUser(user: Data)
    case requestAccessToken(info: Data)
    
    var path: String {
        switch self {
        case .registerUser:
            return "/api/v1/auth/register"
        case .loginUser:
            return "/api/v1/auth/login"
        case .requestAccessToken:
            return "/api/v1/auth/refresh"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .registerUser:
            return .POST
        case .loginUser:
            return .POST
        case .requestAccessToken:
            return .POST
        }
    }
    
    
    var parametrs: [URLQueryItem]? {
        switch self {
        default: return nil
        }
    }
    
    // Добавить accessToken
    var httpBody: Data? {
        switch self {
        case .registerUser(let user):
            return user
        case .loginUser(let user):
            return user
        case .requestAccessToken(let info):
            return info
        }
    }
    
    var httpHeaders: [HttpHeader]? {
        switch self {
        default: return nil
        }
    }
}
