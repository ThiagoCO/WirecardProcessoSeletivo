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
    var view: LoginViewDelegate
    
    init(view:LoginViewController){
        self.view = view
    }
    
    func validateLogin(user: String?, password:String?) {
        if(!(user?.isEmpty ?? true) && !(password?.isEmpty ?? true)) {
            view.startLoad()
            APIManager.shared.requestToken(user!, password!) {
                self.view.stopLoad()
                if APIManager.shared.token == nil {
                    self.view.errorLogin()
                }
                else
                {
                    self.view.validLogin()
                }
            }
        }
    }
}
