//
//  ProductDetailsViewModel.swift
//  Girls for girls
//
//  Created by Adinay on 25/4/23.
//

import Foundation

class ProductDetailsViewModel {
    func postProduct(productId: Int, sizeId: Int, amount: Int, completion: @escaping () -> Void) {
        let ptoducts = ["productId":"\(productId)",
                        "sizeId":"\(sizeId)",
                       "amount":"\(amount)"].toData()
        NetworkManager().sendRequest(urlRequest: ApiService.postAddToCart(product: ptoducts).makeUrlRequest()) { response in
            switch response {
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

//class ProductDetailsViewModel {
//    func postProduct(productId: Int, sizeId: Int, amount: Int, completion: @escaping () -> Void) {
//        let product = ["productId":"\(42)",
//                       "sizeId": "\(4)",
//                       "amount":"\(3)"].toData()
//        NetworkManager().sendRequest(urlRequest: ApiService.addToCart(product: AddTocartModels(productId: 49, sizeId: 2, amount: 2)).makeUrlRequest(), successModel: String.self) { response in
//            switch response {
//            case .success(let string):
//                print(string)
//                completion()
//            case .unauthorized(let string):
//                print(string)
//            case .forebidden(let string):
//                print(string)
//            case .notfound(let string):
//                print(string)
//            case .badrequest(let string):
//                print(string)
//            case .failerror(let string):
//                print(string)
//            }
//        }
//    }
//}




//NetworkManager().sendRequest(urlRequest: Register.getAllProducts(product: addProduct).makeUrlRequest()) { respose in
//            switch respose {
//            case .success(let string):
//                print(string)
//                completion()
//            case .unauthorized(let string):
//                print(string)
//            case .forebidden(let string):
//                print(string)
//            case .notfound(let string):
//                print(string)
//            case .badrequest(let string):
//                print(string)
//            case .failerror(let string):
//                print(string)
//            }
//        }
//    }
//}
