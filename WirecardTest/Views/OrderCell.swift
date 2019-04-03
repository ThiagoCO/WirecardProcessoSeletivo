//
//  TableViewCell.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 28/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

class OrderCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var identificationLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imagePaymentMethod: UIImageView!
    
    //MARK: - Functions
    func configure(order:Order) {
        imagePaymentMethod.image = (order.payments[0].fundingInstrument.method == "CREDIT_CARD") ? UIImage(named: "cardIcon") : UIImage(named: "ticketIcon")
        valueLabel.text = order.amount.total.formatterPriceBRL()
        emailLabel.text = order.customer.email
        identificationLabel.text = order.ownId
        statusLabel.text = order.status
        dateLabel.text = order.createdAt.formaterDate()
    }
}
