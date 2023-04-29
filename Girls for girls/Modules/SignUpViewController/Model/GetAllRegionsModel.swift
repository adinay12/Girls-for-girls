//
//  GetAllRegionsModel.swift
//  Girls for girls
//
//  Created by Adinay on 26/4/23.
//

import Foundation

struct GetAllRegionsModel: Decodable {
   let id: Int?
   let name: String?
    
    enum CodingKeys: String, CodingKey {
        case  id
        case name 
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}
