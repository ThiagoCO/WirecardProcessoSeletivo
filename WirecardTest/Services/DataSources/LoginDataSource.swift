//
//  TokenDataSource.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 02/04/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

protocol LoginDataSource {
     func requestToken(_ user:String, _ password:String, completed:@escaping(_ token: Token?) -> Void) 
}
