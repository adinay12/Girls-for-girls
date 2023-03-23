//
//  Server+Extenshion.swift
//  Girls for girls
//
//  Created by Adinay on 21/3/23.
//

import Foundation

extension Dictionary {
    func toData() -> Data {
        (try? JSONSerialization.data(withJSONObject: self)) ?? Data()
    }
}

extension Encodable {
    func toData() -> Data {
        (try? JSONEncoder().encode(self)) ?? Data()
    }
}
