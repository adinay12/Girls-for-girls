//
//  LoginResponse.swift
//  Girls for girls
//
//  Created by Adinay on 24/3/23.
//

import Foundation

struct LoginResponse: Codable {
    let userId: Int?
    let accessToken: String?
    let refreshToken: String?
}
