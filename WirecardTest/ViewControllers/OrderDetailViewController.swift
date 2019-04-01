//
//  OrderDetailViewController.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 30/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit
import Money

class OrderDetailViewController: UIViewController {
    
    //MARK: - Propreties
    var order: Order?
    var activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    var viewModel: OrderDetailViewModel?
    var statusColor: CGColor?
    var statusText: String?
    //MARK: - Outlets
    @IBOutlet weak var orderIdLabel: UILabel!
    @IBOutlet weak var ownIdLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var methodPaymentLabel: UILabel!
    @IBOutlet weak var createdDateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusDateLabel: UILabel!
    @IBOutlet weak var resumeValueLabel: UILabel!
    @IBOutlet weak var resumeFeesLabel: UILabel!
    @IBOutlet weak var resumeLiquidValueLabel: UILabel!
    @IBOutlet weak var resumePaymentCount: UILabel!
    @IBOutlet weak var resumeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel = OrderDetailViewModel(view: self, orderId: order?.id)
    }
    
    func configure() {
        orderIdLabel.text = order?.id
        ownIdLabel.text = order?.ownId
        valueLabel.text = (BRL(order?.amount.total ?? 0)).description
        methodPaymentLabel.text = (order?.payments[0].fundingInstrument.method == "CREDIT_CARD") ? "Cartão de credito" : "Boleto"
        createdDateLabel.text = order?.createdAt.formaterDate()
        statusDateLabel.text = order?.updatedAt.formaterDate()
        configureStatusLabel()
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func configureStatusLabel() {
        if let color = statusColor, let text = statusText {
            statusLabel.layer.borderColor = color
            statusLabel.textColor = UIColor(cgColor: color)
            statusLabel.text = text
        }
    }
}
