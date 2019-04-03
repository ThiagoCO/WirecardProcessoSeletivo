//
//  Order.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 27/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

struct Order: Codable {
    var id: String
    var ownId: String
    var amount: Amount
    var status: String
    var customer: Customer
    var createdAt: String
    var updatedAt: String
    var payments: [Payment]
}

struct OrderList : Codable {
    var summary: Summary
    var orders: [Order]
}

struct Summary: Codable {
    var count: Int
    var amount: Int
}

struct Amount: Codable {
    var total: Double
}

struct Customer: Codable {
    var email: String
}

struct Payment: Codable {
    var fundingInstrument: FundingInstrument
}

struct FundingInstrument: Codable {
    var method: String
}
