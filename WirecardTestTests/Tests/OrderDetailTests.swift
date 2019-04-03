//
//  OrderDetailTests.swift
//  WirecardTestTests
//
//  Created by Thiago Cavalcante de Oliveira on 03/04/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import XCTest
@testable import WirecardTest

class OrderDetailViewMock: DetailViewProtocol {
    
    var didSetResumeOrderDetail: Bool = false
    var failedFetchOrderDetail: Bool = false
    var startedLoading: Bool = false
    var stoppedLoading: Bool = false

    func setResumeOrderDetail(_ orderDetail: OrderDetail) {
        didSetResumeOrderDetail = true
    }
    
    func errorMessage() {
        failedFetchOrderDetail = true
    }
    
    func stopLoad() {
        startedLoading = true
    }
    
    func startLoad() {
        stoppedLoading = true
    }
}

class OrderDetailTests: XCTestCase {
   
    var orderDetailViewMock: OrderDetailViewMock!
    var orderMock: OrderMock!
    
    override func setUp() {
        orderDetailViewMock = OrderDetailViewMock()
        orderMock = OrderMock()
    }

    override func tearDown() {
        orderDetailViewMock = nil
        orderMock = nil
    }
    
    func testOrderDetailSucess() {
        orderMock.successCase = true
        let orderDetailViewModel = OrderDetailViewModel(view: orderDetailViewMock, service: orderMock, orderId: "123456")
        orderDetailViewModel.getOrderDetail()
        XCTAssertTrue(orderDetailViewMock.didSetResumeOrderDetail)
        XCTAssertFalse(orderDetailViewMock.failedFetchOrderDetail)
    }
    
    func testOrderDetailFailed() {
        let orderDetailViewModel = OrderDetailViewModel(view: orderDetailViewMock, service: orderMock, orderId: "123456")
        orderDetailViewModel.getOrderDetail()
        XCTAssertFalse(orderDetailViewMock.didSetResumeOrderDetail)
        XCTAssertTrue(orderDetailViewMock.failedFetchOrderDetail)
    }
    
}
