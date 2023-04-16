//
//  AddProductViewModel .swift
//  Girls for girls
//
//  Created by Adinay on 14/4/23.
//

import Foundation

class AddProductViewModel {
    
    // MARK: Запрос на Добавление Товара
    
    func postAddProduct(title: String, description: String, price: String, size: String, completion: @escaping () -> Void) {
        let addProduct = ["title":"\(title)",
                          "description":"\(description)",
                          "price":"\(price)",
                          "size": "\(size)"].toData()
        NetworkManager().sendRequest(urlRequest: Register.getAllProducts(product: addProduct).makeUrlRequest()) { respose in
            switch respose {
            case .success(let string):
                print(string)
                completion()
            case .unauthorized(let string):
                print(string)
            case .forebidden(let string):
                print(string)
            case .notfound(let string):
                print(string)
            case .badrequest(let string):
                print(string)
            case .failerror(let string):
                print(string)
            }
        }
    }
}

