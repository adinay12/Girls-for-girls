//
//  New.swift
//  Girls for girls
//
//  Created by Adinay on 10/3/23.
//

import UIKit

class New: BaseViewController {
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .darkGray
    }
    
}
    
    
        
//    1. Создайте функцию для сохранения accessToken в UserDefaults:
//
//    ```swift
//    func saveAccessToken(token: String) {
//        UserDefaults.standard.set(token, forKey: "accessToken")
//    }
//    ```
//
//    2. Создайте функцию для извлечения accessToken из UserDefaults:
//
//    ```swift
//    func getAccessToken() -> String? {
//        return UserDefaults.standard.string(forKey: "accessToken")
//    }
//    ```
//
//    3. При отправке каждого запроса к серверу добавляйте accessToken в header:
//
//    ```swift
//    if let accessToken = getAccessToken() {
//        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
//    }
//    ```
//
//    Теперь accessToken будет добавляться в header каждого запроса к серверу, если он есть в UserDefaults.
//}



//    {
//      "email": "string",
//      "firstName": "string",
//      "lastName": "string",
//      "password": "string",
//      "confirmPass": "string",
//      "placeOfBirth": "string",
//      "phoneNumber": "string"
//    }
    
    
//   // MARK:  Параметры запроса на Регистрацию
//    let parameters: [String: Any] = [
//        "name": "Адинай",
//        "surname": "Джакупаева",
//        "phone": "996552313636",
//        "email": "0552313636s@gmail.com",
//        "password": "1234",
//        "confirmPassword": "1234"
//    ]
//
//    override func setupViews() {
//        super.setupViews()
//        view.backgroundColor = .systemBlue
//    }
//
//    override func setupConstrains() {
//        super.setupConstrains()
//    }
//}

//networkMnager.register(email: email.lowercased(), firstName: firstName.lowercased(), lastName: lastName.lowercased(), password: password.lowercased(), confirmPass: confirmPass.lowercased(), placeOfBirth: placeOfBirth.lowercased(), phoneNumber: phoneNumber.lowercased())
//
//}
