//
//  OrderMock.swift
//  WirecardTestTests
//
//  Created by Thiago Cavalcante de Oliveira on 02/04/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation
@testable import WirecardTest

class OrderMock: OrdersDataSource {
   
    var successCase: Bool = false
    
    func getOrderlist(completed: @escaping (OrderList?) -> Void) {
        
        if (successCase) {
            var orders:[Order] = []
            var payment:[Payment] = []
            
            payment.append(Payment(fundingInstrument: FundingInstrument(method: "CREDIT_CARD")))
            orders.append(Order(id: "123", ownId: "123", amount: Amount(total: 1000), status: "PAID", customer: Customer(email: "thiago.cavalcante15@hotmail.com"), createdAt: "2018-08-28T22:20:42-0300", updatedAt: "2018-08-28T22:20:42-0300", payments: payment))
            orders.append(Order(id: "124", ownId: "124", amount: Amount(total: 2000), status: "REVERTED", customer: Customer(email: "jose.maques@hotmail.com"), createdAt: "2018-08-28T22:20:42-0300", updatedAt: "2018-08-28T22:20:42-0300", payments: payment))
            orders.append(Order(id: "125", ownId: "125", amount: Amount(total: 400), status: "WAITING", customer: Customer(email: "vitor.lourenco@hotmail.com"), createdAt: "2018-08-28T22:20:42-0300", updatedAt: "2018-08-28T22:20:42-0300", payments: payment))
            
            completed(OrderList(summary: Summary(count: 3, amount: 3400), orders: orders))
        }
        else {
            completed(nil)
        }
       
    }
    
    func getOrderDetail(orderId: String, completed: @escaping (OrderDetail?) -> Void) {
        if successCase {
            var payment: [PaymentDetail] = []
            payment.append(PaymentDetail(installmentCount: 2, amount: AmountDetail(total: 1000, fees: 200, liquid: 800)))
            
            completed(OrderDetail(payments: payment))
        }
        else {
            completed(nil)
        }
        
    }
    
    
}
