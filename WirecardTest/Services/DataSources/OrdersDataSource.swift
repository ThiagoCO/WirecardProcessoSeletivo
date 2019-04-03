//
//  OrdersDataSource.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 01/04/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

protocol OrdersDataSource {
    func getOrderlist(completed: @escaping(_ orders: OrderList?) -> Void)
    func getOrderDetail(orderId:String, completed: @escaping(_ orderDetail: OrderDetail?) -> Void)
}
