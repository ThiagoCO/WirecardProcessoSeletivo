//
//  LoginMock.swift
//  WirecardTestTests
//
//  Created by Thiago Cavalcante de Oliveira on 02/04/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

@testable import WirecardTest

class LoginMock: LoginDataSource {
    
    var successCase: Bool = false
    
    func requestToken(_ user: String, _ password: String, completed: @escaping (Token?) -> Void) {
        if successCase {
            completed(Token(accessToken: "123-456-789"))
        } else {
            completed(nil)
        }
    }
    
}
