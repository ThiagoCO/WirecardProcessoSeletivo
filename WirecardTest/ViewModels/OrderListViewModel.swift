//
//  OrderListViewModel.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 26/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class OrderListViewModel {
    var view: OrderListProtocol
    var orderList: OrderList?
    var service: OrdersDataSource
    
    init(view: OrderListProtocol, service:OrdersDataSource) {
        self.view = view
        self.service = service
        self.getOrderList()
    }
    
    func getOrderList() {
        view.startLoad()
        service.getOrderlist() { (orderList) in
            if let orders = orderList {
                self.orderList = orders
                self.view.reloadTable()
                self.view.setAmountView(summary: orders.summary)
            }
            else {
                self.view.errorMessage()
            }
            self.view.stopLoad()
        }
        
    }
    
    func getOrdersCount() -> Int {
        return orderList?.orders.count ?? 0
    }

    func configureStatusLabel(index:Int) -> (CGColor, String){
        var color = UIColor.white.cgColor
        var text = ""
    
        if let orderStatus = orderList?.orders[index].status {
            switch orderStatus {
                case "PAID":
                    color = UIColor.green.cgColor
                    text = "PAGO"
                case "REVERTED":
                    color = UIColor.blue.cgColor
                    text = "ESTORNADO"
                default:
                    color =  UIColor(red:1.00, green:0.84, blue:0.00, alpha:1.0).cgColor
                    text = "PENDENTE"
            }
        }
        return (color, text)
    }
}
