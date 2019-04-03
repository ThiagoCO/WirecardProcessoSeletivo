//
//  OrderDetailViewController+DetailViewDelgate.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 31/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

protocol DetailViewProtocol: ActivityIndicatorDelegate {
    func setResumeOrderDetail(_ orderDetail: OrderDetail)
    func errorMessage()
}
extension OrderDetailViewController: DetailViewProtocol {
    
    func setResumeOrderDetail(_ orderDetail: OrderDetail) {
        resumeValueLabel.text = "+ \(orderDetail.payments[0].amount.total.formatterPriceBRL())"
        resumeFeesLabel.text = "- \(orderDetail.payments[0].amount.fees.formatterPriceBRL())"
        resumeLiquidValueLabel.text = "= \(orderDetail.payments[0].amount.liquid.formatterPriceBRL())"
        
        let paymentCount = orderDetail.payments[0].installmentCount
        
        resumePaymentCount.text = "\(paymentCount) pagamento\(paymentCount > 1 ? "s" : "")"
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
    
    func errorMessage() {
        self.showAlert(title: "OPS!", message: "Ocorreu algum problema na conexão tente novamente")
    }
    
}
