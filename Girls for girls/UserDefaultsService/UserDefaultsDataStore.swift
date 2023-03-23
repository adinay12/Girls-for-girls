//
//  UserDefaultsDataStore.swift
//  Girls for girls
//
//  Created by Adinay on 22/3/23.
//

import Foundation

protocol UserDefaultsDataStoreProtocol {
    
    // Эта функция Сюда будет приходить токен
    func setAccessToken(_ token: String?)
    // Вытаскиваем AccessToken
    func getAccessToken() -> String?  // возращает String обьект
    
    // Сюда будет приходить токен setRefreshToken
    func setRefreshToken(_ token: String?)
    // Вытаскиваем getRefreshToken
    func getRefreshToken() -> String?
    
    // Сюда будет приходить токен setId
    func setId(_id: String?)
    func getId() -> String?
    
    // Уничтажение обьектов
    func removeAll()
}







//    Создайте функцию для сохранения accessToken в UserDefaults:

func saveAccessToken(token: String) {
    UserDefaults.standard.set(token, forKey: "accessToken")
}

//  Создайте функцию для извлечения accessToken из UserDefaults:

func getAccessToken() -> String? {
    return UserDefaults.standard.string(forKey: "accessToken")
}


let refreshToken = UserDefaults.standard.string(forKey: "refreshToken")
let accessToken = UserDefaults.standard.string(forKey: "accessToken")
let id = UserDefaults.standard.string(forKey: "2")
