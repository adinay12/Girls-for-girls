//
//  SpeakersModel.swift
//  Girls for girls
//
//  Created by Adinay on 29/4/23.
//

import Foundation

struct SpeakersModel: Decodable {
    let id: Int?
    let full_name: String?
    let full_info: String?
    let image_url: String?
    let instagram: String?
    let whatsapp: String?
    let facebook: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case full_name
        case full_info
        case image_url
        case instagram
        case whatsapp
        case facebook
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        full_name = try container.decodeIfPresent(String.self, forKey: .full_name)
        full_info = try container.decodeIfPresent(String.self, forKey: .full_info)
        image_url = try container.decodeIfPresent(String.self, forKey: .image_url)
        instagram = try container.decodeIfPresent(String.self, forKey: .instagram)
        whatsapp = try container.decodeIfPresent(String.self, forKey: .whatsapp)
        facebook = try container.decodeIfPresent(String.self, forKey: .facebook)
    }
}

