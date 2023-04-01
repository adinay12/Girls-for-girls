//
//  ProResuls.swift
//  Girls for girls
//
//  Created by Adinay on 21/3/23.
//

import Foundation

enum ProResuls <M>  {
    case success(M)
    case unauthorized(String)
    case forebidden(String)
    case notfound(String)
    case badrequest(String)
    case failerror(String)
}


enum ResponseResult {
    case success(String)
    case unauthorized(String)
    case forebidden(String)
    case notfound(String)
    case badrequest(String)
    case failerror(String)
}
