//
//  LoginAPI.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 02/04/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class LoginAPI: LoginDataSource {
    
    let clientId = "APP-H1DR0RPHV7SP"
    let clientSecret = "05acb6e128bc48b2999582cd9a2b9787"
    let grantType = "password"
    let deviceId = "1234"
    let scope = "APP_ADMIN"
    
    func requestToken(_ user:String, _ password:String, completed:@escaping(_ token :Token?) -> Void) {
        APIClient().request(model: Token.self, url: "https://connect-sandbox.moip.com.br/oauth/token", method: .post, headers: configureHeader(), parameters: configureParameter(user, password)) { (token) in
            completed(token)
        }
    }
    
    private func configureHeader() -> Dictionary<String,String> {
        //guard let token = TokenRepository.shared.token?.accessToken else { return [:]}
        let header: [String:String] = ["Content-Type": "application/x-www-form-urlencoded"]
        return header
    }
    
    private func configureParameter(_ user:String, _ password:String) -> Dictionary<String,String> {
        let parameter = [
            "client_id": clientId,
            "client_secret": clientSecret,
            "grant_type": grantType,
            "username": user,
            "password": password,
            "device_id": deviceId,
            "scope": scope
        ]
        return parameter
    }

}
