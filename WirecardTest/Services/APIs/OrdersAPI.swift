//
//  OrdersAPI.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 01/04/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class OrdersAPI: OrdersDataSource {
    
    private func configureHeader() -> Dictionary<String,String> {
        guard let token = TokenRepository.shared.token?.accessToken else { return [:]}
        let header: [String:String] = ["authorization": "OAuth \(token)"]
        return header
    }
    
    func getOrderlist(completed: @escaping (OrderList?) -> Void) {
        APIClient().request(model: OrderList.self, url: "https://sandbox.moip.com.br/v2/orders?filters=&limit=100&offset=0", method: .get, headers: configureHeader()) { (orderList) in
            completed(orderList)
        }
    }
    
    func getOrderDetail(orderId: String, completed: @escaping (OrderDetail?) -> Void) {
        APIClient().request(model: OrderDetail.self, url: "https://sandbox.moip.com.br/v2/orders/\(orderId)", method: .get, headers: configureHeader()) { (orderDetail) in
            completed(orderDetail)
        }
    }
    
}
