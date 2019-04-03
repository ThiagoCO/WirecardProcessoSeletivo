//
//  TokenRepository.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 02/04/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class TokenRepository {
    static let shared = TokenRepository()
    var token: Token?
}
