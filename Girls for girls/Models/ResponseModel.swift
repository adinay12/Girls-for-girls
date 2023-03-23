//
//  ResponseModel.swift
//  Girls for girls
//
//  Created by Adinay on 22/3/23.
//

import Foundation

struct ResponseModel: Decodable {
    let response: String?
        
        enum CodingKeys: String, CodingKey {
            case response
        }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
    }
}
