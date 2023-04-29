//
//  Register.swift
//  Girls for girls
//
//  Created by Adinay on 21/3/23.
//

import Foundation

enum ApiService: BaseRouterProtocol {
    case registerUser(user: Data)
    case loginUser(user: Data)
    case requestAccessToken(info: Data)
    case getActiveToken(token: String)
    case postForgotEmail(email: String)
    case getResetToken(token: String)
    case postResetToken(user: Data, token: String)
    
//    case postApplications(aplications: Data)
//    case getAllProducts(product: Data)
    case сhangeAccount(user: Data)
    
    case addToCart(product: AddTocartModels)

    case сhangePassword(password:Data)
    
    
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
//        case .getAllProducts(let product):
//            return "/api/v1/product"
            
        case .сhangeAccount(let user):
            return "/api/v1/user"
            
        case .addToCart:
            return "/api/v1/myBasket"
        case .сhangePassword(let password):
            return "/api/v1/user/change-password"
        
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
//            return .POST
//        case .getAllProducts:
//            return .GET
            
        case .сhangeAccount:
            return .PUT
        case .addToCart:
            return.POST
        case .сhangePassword:
            return .POST
       
        }
    }
    
    var parametrs: [URLQueryItem]? {
        switch self {
        case .addToCart(let product):
            return [URLQueryItem(name: "productId", value: "\(String(describing: product.productId))"),
                    URLQueryItem(name: "sizeId", value:"\(String(describing: product.sizeId))"),
                    URLQueryItem(name: "amount", value:"\(String(describing: product.amount))")]
                                        
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
//        case .getAllProducts(let product):
//            return product
        case .сhangeAccount(let user):
            return user
        case .addToCart(let product):
            return nil
        case .сhangePassword(let password):
            return password 
       
        }
    }
    
    // В headar добавить accessToken
    var httpHeaders: [HttpHeader]? {
        switch self {
        case.addToCart:
            return [HttpHeader(field: "Authorization", value: "Bearer \(DSGenerator.sharedInstance.getAccessToken()!)")]
        default: return nil
        }
    }
}
