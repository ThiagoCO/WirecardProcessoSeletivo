//
//  OrderListViewController+OrderListDelegate.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 26/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit
import Money

protocol OrderListDelegate: ActivityIndicatorDelegate {
    func reloadTable()
    func setAmountView(summary: Summary)
}
extension OrderListViewController: OrderListDelegate {
    
    func setAmountView(summary: Summary) {
        amountLabel.text = "\(summary.count) pedidos totalizando \(String(summary.amount).formatCustomMoney())"
    }
    
    func stopLoad() {
        ordersTableView.isHidden = false
        activityIndicator.removeFromSuperview()
    }
    
    func startLoad() {
        ordersTableView.isHidden = true
        self.view.addSubview(activityIndicator)
        activityIndicator.frame = view.frame
        activityIndicator.startAnimating()
    }
    
    func reloadTable(){
        ordersTableView.reloadData()
    }
    
}
