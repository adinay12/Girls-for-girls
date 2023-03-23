//
//  BaseRouter.swift
//  Girls for girls
//
//  Created by Adinay on 21/3/23.
//

import Foundation

protocol BaseRouterProtocol {
    var path: String { get }
    var method: HttpMethod { get }
    var parametrs: [URLQueryItem]? { get }
    var httpBody: Data? { get }
    var httpHeaders: [HttpHeader]? { get }
   
}


extension BaseRouterProtocol {
    var host: String   { return "g4g.herokuapp.com"}
    var skim: String {return "https" }
    
    func makeUrlRequest() -> URLRequest {
        var components =  URLComponents()
        components.path = path
        components.host = host
        components.scheme = skim
        components.queryItems = parametrs
        guard let url = components.url else {
            fatalError(URLError(.unsupportedURL).localizedDescription)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = httpBody
        httpHeaders?.forEach({ (header) in
            urlRequest.setValue(header.value, forHTTPHeaderField: header.field)
        })
        
        // В headar добавить accessToken
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        return urlRequest
    }
}
