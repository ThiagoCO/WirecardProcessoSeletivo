//
//  OrderListViewController+TableView.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 28/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

extension OrderListViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Extension Functions
    func setupTableView() {
        self.ordersTableView.dataSource = self
        self.ordersTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getOrdersCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderCell
        if let viewModel = viewModel {
            if let order = viewModel.orderList?.orders[indexPath.row] {
                cell.configure(order: order)
                let statusConfig = viewModel.configureStatusLabel(index: indexPath.row)
                cell.statusLabel.layer.borderColor = statusConfig.0
                cell.statusLabel.text = statusConfig.1
                cell.statusLabel.textColor = UIColor(cgColor: statusConfig.0)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "orderDetail") as? OrderDetailViewController {
            controller.order = viewModel?.orderList?.orders[indexPath.row]
            let statusConfig = viewModel?.configureStatusLabel(index: indexPath.row)
            if let config = statusConfig {
                controller.statusColor = config.0
                controller.statusText = config.1
            }
            present(controller, animated: true, completion: nil)
        }
    }
}
