//
//  ListOrderViewController.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 23/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

class OrderListViewController: UIViewController {

    //MARK: - Properties
    var activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    var viewModel: OrderListViewModel?
    //MARK: - Outlets
    @IBOutlet weak var ordersTableView: UITableView!
    @IBOutlet weak var amountLabel: UILabel!
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel = OrderListViewModel(view: self, service: OrdersAPI())
    }
}
