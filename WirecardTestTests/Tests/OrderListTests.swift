//
//  OrderListTests.swift
//  WirecardTestTests
//
//  Created by Thiago Cavalcante de Oliveira on 02/04/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import XCTest
@testable import WirecardTest

class OrderListViewMock: OrderListProtocol {
    
    var reloadedTable: Bool = false
    var didSetAmount: Bool = false
    var failedFetchList: Bool = false
    var startedLoading: Bool = false
    var stoppedLoading: Bool = false
    
    func reloadTable() {
        reloadedTable = true
    }
    
    func setAmountView(summary: Summary) {
        didSetAmount = true
    }
    
    func errorMessage() {
        failedFetchList = true
    }
    
    func stopLoad() {
        stoppedLoading = true
    }
    
    func startLoad() {
        startedLoading = true
    }
    
}
class OrderListTests: XCTestCase {
   
    var orderListViewMock: OrderListViewMock!
    var orderMock: OrderMock!
    
    override func setUp() {
        orderListViewMock = OrderListViewMock()
        orderMock = OrderMock()
    }

    override func tearDown() {
        orderListViewMock = nil
        orderMock = nil
    }
    
    func testListSucess() {
        orderMock.successCase = true
        
        let orderListViewModel = OrderListViewModel(view: orderListViewMock, service: orderMock)
        orderListViewModel.getOrderList()
        XCTAssertTrue(orderListViewMock.reloadedTable)
        XCTAssertTrue(orderListViewMock.didSetAmount)
        XCTAssertFalse(orderListViewMock.failedFetchList)
    }
    
    func testListFail() {
        let orderListViewModel = OrderListViewModel(view: orderListViewMock, service: orderMock)
        orderListViewModel.getOrderList()
        XCTAssertFalse(orderListViewMock.reloadedTable)
        XCTAssertFalse(orderListViewMock.didSetAmount)
        XCTAssertTrue(orderListViewMock.failedFetchList)
    }
    
    func testListCount() {
        orderMock.successCase = true
        
        let orderListViewModel = OrderListViewModel(view: orderListViewMock, service: orderMock)
        orderListViewModel.getOrderList()
        
        XCTAssert(orderListViewModel.getOrdersCount() == 3)
    }
    
    func testNullListCount() {
        orderMock.successCase = false
    
        let orderListViewModel = OrderListViewModel(view: orderListViewMock, service: orderMock)
        orderListViewModel.getOrderList()
        
        XCTAssert(orderListViewModel.getOrdersCount() == 0)
    }
    
    func testStatusPaid() {
        orderMock.successCase = true
        
        let orderListViewModel = OrderListViewModel(view: orderListViewMock, service: orderMock)
        let statusConfig = orderListViewModel.configureStatusLabel(index: 0)
        
        XCTAssertEqual(statusConfig.1, "PAGO")
    }
    
    func testStatusReverted() {
        orderMock.successCase = true
        
        let orderListViewModel = OrderListViewModel(view: orderListViewMock, service: orderMock)
        let statusConfig = orderListViewModel.configureStatusLabel(index: 1)
        
        XCTAssertEqual(statusConfig.1, "ESTORNADO")
    }
    
    func testStatusWaiting() {
        orderMock.successCase = true
        
        let orderListViewModel = OrderListViewModel(view: orderListViewMock, service: orderMock)
        let statusConfig = orderListViewModel.configureStatusLabel(index: 2)
        
        XCTAssertEqual(statusConfig.1, "PENDENTE")
    }
    
}
