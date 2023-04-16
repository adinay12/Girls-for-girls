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
    
//    case postApplications(aplications: Data)
    case getAllProducts(product: Data)
    case сhangeAccount(user: Data)
    
    
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
//        case .postApplications:
//            return "/api/v1/applications"
        case .getAllProducts(let product):
            return "/api/v1/product"
        case .сhangeAccount(let user):
            return "/api/v1/user"
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
//        case .postApplications:
            return .POST
        case .getAllProducts:
            return .GET
        case .сhangeAccount:
            return .PUT
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
//        case .postApplications(let aplications):
//            return nil
        case .getAllProducts(let product):
            return product
        case .сhangeAccount(let user):
            return user
        }
    }
    
    var httpHeaders: [HttpHeader]? {
        switch self {
        default: return nil
        }
    }
}
