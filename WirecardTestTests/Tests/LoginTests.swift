//
//  WirecardTestTests.swift
//  WirecardTestTests
//
//  Created by Thiago Cavalcante de Oliveira on 20/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import XCTest
@testable import WirecardTest

class LoginViewMock: LoginViewProtocol {
    
    var validatedLogin: Bool = false
    var failedLogin: Bool = false
    var startedLoading: Bool = false
    var stoppedLoading: Bool = false
    
    func validLogin() {
        validatedLogin = true
    }
    
    func errorLogin() {
        failedLogin = true
    }
    
    func stopLoad() {
        stoppedLoading = true
    }
    
    func startLoad() {
        startedLoading = true
    }
    
}

class LoginTests: XCTestCase {
    
    var loginViewMock: LoginViewMock!
    var loginMock: LoginMock!

    override func setUp() {
        loginViewMock = LoginViewMock()
        loginMock = LoginMock()
    }

    override func tearDown() {
        loginViewMock = nil
        loginMock = nil
    }

    func testLoginSuccess() {
        loginMock.successCase = true
        
        let loginViewModel = LoginViewModel(view: loginViewMock, service: loginMock)
        
        loginViewModel.validateLogin(user: "fulano", password: "123456")
        
        XCTAssertTrue(loginViewMock.validatedLogin)
        XCTAssertFalse(loginViewMock.failedLogin)
    }
    
    func testLoginFail() {
        loginMock.successCase = false
        
        let loginViewModel = LoginViewModel(view: loginViewMock, service: loginMock)
        
        loginViewModel.validateLogin(user: "fulano", password: "123456")
        
        XCTAssertFalse(loginViewMock.validatedLogin)
        XCTAssertTrue(loginViewMock.failedLogin)
    }
    
    func testLoginNil() {
        let loginViewModel = LoginViewModel(view: loginViewMock, service: loginMock)
        
        loginViewModel.validateLogin(user: nil, password: nil)
        
        XCTAssertFalse(loginViewMock.validatedLogin)
        XCTAssertTrue(loginViewMock.failedLogin)
    }
    
    func testLoginEmpty() {
        let loginViewModel = LoginViewModel(view: loginViewMock, service: loginMock)
        
        loginViewModel.validateLogin(user: "", password: "")
        
        XCTAssertFalse(loginViewMock.validatedLogin)
        XCTAssertTrue(loginViewMock.failedLogin)
    }

}
