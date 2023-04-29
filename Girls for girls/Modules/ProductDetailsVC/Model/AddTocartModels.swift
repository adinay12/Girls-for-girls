//
//  AddTocartModels.swift
//  Girls for girls
//
//  Created by Adinay on 24/4/23.
//

import Foundation

struct AddTocartModels: Decodable {
    let productId: Int?
    let sizeId: Int?
    let amount: Int?
    
    enum CodingKeys: String, CodingKey {
        case productId
        case sizeId
        case amount
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        productId = try container.decodeIfPresent(Int.self, forKey: .productId)
        sizeId = try container.decodeIfPresent(Int.self, forKey: .sizeId)
        amount = try container.decodeIfPresent(Int.self, forKey: .amount)
    }
    
    init(productId: Int, sizeId: Int, amount: Int) {
        self.productId = productId
        self.sizeId = sizeId
        self.amount = amount
    }
}
