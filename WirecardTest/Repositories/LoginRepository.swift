//
//  LoginRepository.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 01/04/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class LoginRepository {
    
    static var shared = LoginRepository()
    
    func save(user: String, password: String) {
        UserDefaults.standard.set(user, forKey: "wirecard_user")
        UserDefaults.standard.set(password, forKey: "wirecard_password")
    }
    
    func get() -> (String?, String?) {
        let user = UserDefaults.standard.string(forKey: "wirecard_user")
        let password = UserDefaults.standard.string(forKey: "wirecard_password")
        return (user, password)
    }
    
    func delete() {
        UserDefaults.standard.removeObject(forKey: "wirecard_user")
        UserDefaults.standard.removeObject(forKey: "wirecard_password")
    }
    
}
