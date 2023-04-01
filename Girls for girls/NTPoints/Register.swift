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
    case getActiveToken(token: String)
    case postForgotEmail(email: String)
    case getResetToken(token: String)
    case postResetToken(user: Data, token: String)
    
    var path: String {
        switch self {
        case .registerUser:
            return "/api/v1/auth/register"
        case .loginUser:
            return "/api/v1/auth/login"
        case .requestAccessToken:
            return "/api/v1/auth/refresh"
        case .getActiveToken(let token):
            return "/api/v1/auth/active/\(token)"
        case .postForgotEmail(let email):
            return "/api/v1/password/forgot/\(email)"
        case .getResetToken(let token):
            return "/api/v1/password/reset/\(token)"
        case .postResetToken(let user, let token):
            return "/api/v1/password/reset/\(token)"
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
        case .getActiveToken:
            return .GET
        case .postForgotEmail:
            return .POST
        case .getResetToken:
            return .GET
        case .postResetToken:
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
        case .getActiveToken:
            return nil
        case .postForgotEmail:
            return nil
        case .getResetToken:
            return nil
        case .postResetToken(let password, let token):
            return password
        }
    }
    
    var httpHeaders: [HttpHeader]? {
        switch self {
        default: return nil
        }
    }
}
