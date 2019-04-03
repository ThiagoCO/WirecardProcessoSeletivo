//
//  APIClient.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 01/04/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation
import Alamofire

extension Data {
    func parseAs<T: Decodable>(_ model: T.Type) -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}

class APIClient {
    func request<T: Decodable>(model: T.Type, url: String, method: HTTPMethod, headers: [String: String]? = nil, parameters: [String: String]? = nil, encoding: ParameterEncoding = URLEncoding.default, completed: @escaping(_ object: T?) -> Void) {
        
        Alamofire.request(url, method: method, parameters: parameters, headers: headers).responseJSON { (response) in
            if let data = response.data {
                completed(data.parseAs(T.self))
            }
        }
        
    }
    
}
