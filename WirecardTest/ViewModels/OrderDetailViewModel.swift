//
//  OrderDetailViewModel.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 31/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class OrderDetailViewModel {
    
    //MARK: - Proprities
    var view:DetailViewProtocol
    var orderId: String?
    var service: OrdersDataSource
    
    //MARK: - Functions
    init(view: DetailViewProtocol, service: OrdersDataSource, orderId: String?) {
        self.view = view
        self.orderId = orderId
        self.service = service
        getOrderDetail()

    }
    
    func getOrderDetail() {
        view.startLoad()
        if let id = orderId {
            service.getOrderDetail(orderId: id) { (orderDetail) in
                if let detail = orderDetail {
                    self.view.setResumeOrderDetail(detail)
                }
                else {
                    self.view.errorMessage()
                }
                self.view.stopLoad()
            }
        }
    }
}
 
