//
//  GoodsData.swift
//  Girls for girls
//
//  Created by Adinay on 18/4/23.
//

import Foundation

struct GoodsData: Decodable {
    let title: String?
//    let description: String?
    let price: Int?
//    let sizes:[Sizes]?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case title
//        case description
        case price
//        case sizes
        case imageUrl
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title  = try container.decodeIfPresent(String.self, forKey: .title)
//        description = try container.decodeIfPresent(String.self, forKey: .description)
        price = try container.decodeIfPresent(Int.self, forKey: .price)
////        sizes = try container.decodeIfPresent([Sizes].self, forKey: .sizes)
        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
    }
}


struct Sizes: Decodable{
    let id: Int?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}
