//
//  LoginViewController+LoginViewDelegate.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 22/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: ActivityIndicatorDelegate{
    func validLogin()
    func errorLogin()
}
extension LoginViewController: LoginViewProtocol {
    
    //MARK: - Extensions Functions
    func stopLoad() {
        hideLogin()
        activityIndicator.removeFromSuperview()
    }
    
    func startLoad() {
        self.view.addSubview(activityIndicator)
        activityIndicator.frame = view.frame
        activityIndicator.startAnimating()
        hideLogin()
    }
    
    func validLogin() {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "orders") as? OrderListViewController {
            present(controller, animated: true, completion: nil)
        }
    }
    
    func errorLogin() {
        self.showAlert(title: "Tente Novamente", message: "usuario ou senha incorretos")
        self.stopLoad()
    }
    
    func hideLogin() {
        userTextField.isHidden.toggle()
        passwordTextField.isHidden.toggle()
        buttonLogin.isHidden.toggle()
    }
}
