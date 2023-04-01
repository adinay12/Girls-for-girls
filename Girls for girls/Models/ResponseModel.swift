//
//  ResponseModel.swift
//  Girls for girls
//
//  Created by Adinay on 22/3/23.
//

import Foundation

struct ResponseModel: Decodable {
    
    let some: String?
        
        enum CodingKeys: String, CodingKey {
            case some
        }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        some = try values.decodeIfPresent(String.self, forKey: .some)
    }
}
