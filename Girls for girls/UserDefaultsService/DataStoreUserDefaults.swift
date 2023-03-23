//
//  DataStoreUserDefaults.swift
//  Girls for girls
//
//  Created by Adinay on 22/3/23.
//

import Foundation

class DataStoreUserDefaults: UserDefaultsDataStoreProtocol {
    
    static let shared = DataStoreUserDefaults()
    private  let userDefaults = UserDefaults.standard
    
    // MARK: Ключи для access и erfresh Id Токенов 
    private let pAccessToken = "AccessToken"
    private let pRefreshToken = "RefreshToken"
    private let pId = "PId"
    
    func setAccessToken(_ token: String?) {
        userDefaults.set(token, forKey: pAccessToken)
    }
    
    func getAccessToken() -> String? {
        return userDefaults.string(forKey: pAccessToken)
    }
    
    func setRefreshToken(_ token: String?) {
        userDefaults.set(token, forKey: pRefreshToken)
    }
    
    func getRefreshToken() -> String? {
        return userDefaults.string(forKey: pRefreshToken)
    }
    
    func setId(_id: String?) {
        userDefaults.set(id, forKey: pId)
    }
    
    func getId() -> String? {
        return userDefaults.string(forKey: pId)
    }
    
    // MARK: Полное Удаление данных
    func removeAll() {
        userDefaults.removeObject(forKey: pAccessToken)
        userDefaults.removeObject(forKey: pRefreshToken)
        userDefaults.removeObject(forKey: pId)
    }
}
