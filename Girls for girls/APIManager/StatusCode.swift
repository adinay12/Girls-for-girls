//
//  StatusCode.swift
//  Girls for girls
//
//  Created by Adinay on 22/3/23.
//

import Foundation

enum StatusCode {
    case success
    case badRequest
    case forebidden
    case notFound
    case unathorized
    
    var code: Int {
        switch self {
        case .success:
            return 200
        case .badRequest:
            return 400
        case .forebidden:
            return 403
        case .notFound:
            return 404
        case .unathorized:
            return 401
        }
    }
}
