//
//  OrderDetailViewController+DetailViewDelgate.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 31/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation
import Money

protocol DetailViewDelegate: ActivityIndicatorDelegate {
    func setResumeOrderDetail(_ orderDetail: OrderDetail)
}
extension OrderDetailViewController: DetailViewDelegate {
    
    func setResumeOrderDetail(_ orderDetail: OrderDetail) {
        resumeValueLabel.text = "+ \(BRL(floatLiteral: orderDetail.payments[0].amount.total).description)"
        resumeFeesLabel.text = "- \(BRL(floatLiteral: orderDetail.payments[0].amount.fees).description)"
        resumeLiquidValueLabel.text = "= \(BRL(floatLiteral: orderDetail.payments[0].amount.liquid).description)"
        resumePaymentCount.text = "\(orderDetail.payments[0].installmentCount) pagamentos"
    }
    
    func stopLoad() {
        resumeView.isHidden = false
        activityIndicator.removeFromSuperview()
    }
    
    func startLoad() {
        resumeView.isHidden = true
        self.view.addSubview(activityIndicator)
        activityIndicator.frame = view.frame
        activityIndicator.startAnimating()
    }
    
    
}
