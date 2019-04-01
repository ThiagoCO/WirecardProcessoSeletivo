//
//  Order.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 27/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class Order: Codable {
    var id: String
    var ownId: String
    var amount: Amount
    var status: String
    var customer: Customer
    var createdAt: String
    var updatedAt: String
    var payments: [Payments]
}

class OrderList : Codable {
    var summary: Summary
    var orders: [Order]
}

class Summary: Codable {
    var count: Int
    var amount: Int
}

class Amount: Codable {
    var total: Int
}

class Customer: Codable {
    var email: String
}

class Payments: Codable {
    var fundingInstrument: FundingInstrument
}

class FundingInstrument: Codable {
    var method: String
}
