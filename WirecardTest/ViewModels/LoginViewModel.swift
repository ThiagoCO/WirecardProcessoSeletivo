//
//  LoginViewModel.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 22/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    //MARK: - Variables
    var view: LoginViewProtocol
    var service: LoginDataSource
    
    init(view:LoginViewProtocol, service: LoginDataSource){
        self.view = view
        self.service = service
        automaticLogIn()
    }
    
    private func automaticLogIn() {
        let userData = LoginRepository.shared.get()
        if let user = userData.0, let password = userData.1 {
            validateLogin(user: user, password: password)
        }
    }
    
    func validateLogin(user: String?, password:String?) {
        guard let user = user, let password = password else {
            self.view.errorLogin()
            return
        }
    
        guard !user.isEmpty, !password.isEmpty else {
            self.view.errorLogin()
            return
        }

        view.startLoad()
        service.requestToken(user, password) { (token) in
            
            guard let token = token else {
                LoginRepository.shared.delete()
                self.view.errorLogin()
                return
                
            }
            LoginRepository.shared.save(user: user, password: password)
            TokenRepository.shared.token = token
            self.view.validLogin()
        }
    }
}
