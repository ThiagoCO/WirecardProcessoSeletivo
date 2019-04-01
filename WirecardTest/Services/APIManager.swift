//
//  APIManager.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 20/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    //MARK: = Variables
    static let shared = APIManager()
    let clientId = "APP-H1DR0RPHV7SP"
    let clientSecret = "05acb6e128bc48b2999582cd9a2b9787"
    let grantType = "password"
    let deviceId = "1234"
    let scope = "APP_ADMIN"
    var token:Token?
    
    func requestToken(_ user:String, _ password:String, completed:@escaping() -> Void) {
        
        Alamofire.request("https://connect-sandbox.moip.com.br/oauth/token", method: .post, parameters: configureParameter(user, password), encoding: URLEncoding.default, headers: configureHeader(token: nil)).responseJSON { response in
            if let data = response.data {
                let token = try? JSONDecoder().decode(Token.self, from: data)
                self.token = token
                completed()
            }
        }
    }
    
    func getOrderlist(completed:@escaping(_ orders: OrderList?) -> Void) {
        Alamofire.request("https://sandbox.moip.com.br/v2/orders?filters=&limit=100&offset=0", method: .get, headers: configureHeader(token: token?.accessToken)).responseJSON { (response) in
            if let data = response.data {
                let orders = try? JSONDecoder().decode(OrderList.self, from: data)
                completed(orders)
            }
        }
    }
    
    func getOrderDetail(orderId:String, completed:@escaping(_ orderDetail: OrderDetail?) -> Void) {
        Alamofire.request("https://sandbox.moip.com.br/v2/orders/\(orderId)", method: .get, headers: configureHeader(token: token?.accessToken)).responseJSON { (response) in
            if let data = response.data {
                let orderDetail = try? JSONDecoder().decode(OrderDetail.self, from: data)
                completed(orderDetail)
            }
        }
    }
    
    private func configureHeader(token:String?) -> Dictionary<String,String> {
        let header: HTTPHeaders = (token == nil) ?
            ["Content-Type": "application/x-www-form-urlencoded"] :
            ["authorization": "OAuth \(token!)"]
        
        return header
    }
    
    private func configureParameter(_ user:String, _ password:String) -> Parameters {
        let parameter: Parameters = [
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
