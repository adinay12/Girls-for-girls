//
//  NetworkErrors.swift
//  Girls for girls
//
//  Created by Adinay on 21/3/23.
//

import Foundation

enum NetworkErrors: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
}
