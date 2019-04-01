//
//  OrderDetail.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 31/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class OrderDetail: Codable {
    var payments: [PaymentDetail]
}

class PaymentDetail: Codable {
    var installmentCount: Int
    var amount: AmountDetail
}

class AmountDetail: Codable {
    var total: Double
    var fees: Double
    var liquid: Double
}

