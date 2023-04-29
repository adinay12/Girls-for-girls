//
//  ModelBaskets.swift
//  Girls for girls
//
//  Created by Adinay on 27/4/23.
//

import Foundation

struct ModelBaskets: Decodable {
    let id: Int?
    let products: [Products]?
    let sizes: [Size]?
    let amount: Int?
    let image_url: String?

    enum CodingKeys: String, CodingKey {
        case id
        case products
        case sizes
        case amount
        case image_url
    }

    init(from decoder: Decoder) throws {
        let container =  try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        products = try container.decodeIfPresent([Products].self, forKey: .products)
        sizes = try container.decodeIfPresent([Size].self, forKey: .sizes)
        amount = try container.decodeIfPresent(Int.self, forKey: .amount)
        image_url = try container.decodeIfPresent(String.self, forKey: .image_url)
    }
}

struct Products: Decodable {
    let id: Int?
    let title: String?
    let description: String?
    let price: Int?
    let size: [Size]?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case price
        case size
    }

    init(from decoder: Decoder) throws {
        let container =  try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        price = try container.decodeIfPresent(Int.self, forKey: .price)
        size = try container.decodeIfPresent([Size].self, forKey: .size)
    }
}

struct Size: Decodable {
    let id: Int?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }

    init(from decoder: Decoder) throws {
        let container =  try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
 }
