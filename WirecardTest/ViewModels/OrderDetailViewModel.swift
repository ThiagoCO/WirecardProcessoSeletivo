//
//  OrderDetailViewModel.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 31/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class OrderDetailViewModel {
    
    var view:DetailViewDelegate
    var orderId: String?
    
    init(view:DetailViewDelegate, orderId:String?) {
        self.view = view
        self.orderId = orderId
        getOrderDetail()
    }
    
    func getOrderDetail() {
        view.startLoad()
        if let id = orderId {
            APIManager.shared.getOrderDetail(orderId: id) { (orderDetail) in
                if let detail = orderDetail {
                    self.view.setResumeOrderDetail(detail)
                }
                self.view.stopLoad()
            }
        }
        
    }
}
 
