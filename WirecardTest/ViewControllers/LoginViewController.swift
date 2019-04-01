//
//  ViewController.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 20/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Variables
    var activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    var viewModel: LoginViewModel?
    
    //MARK: - outlets
    @IBOutlet weak var userTextField: TextFieldCustom!
    @IBOutlet weak var passwordTextField: TextFieldCustom!
    @IBOutlet weak var buttonLogin: UIButton!

    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel(view: self)
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        viewModel?.validateLogin(user: "moip-test-developer@moip.com.br", password: "testemoip123")
    }
}

