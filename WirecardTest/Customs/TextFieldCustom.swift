//
//  PasswordTextField.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 21/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

class TextFieldCustom: UITextField {
    
    //MARK: - Properties
    let padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 5)
    let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 30, height: 30))
    
    @IBInspectable var leftIcon: UIImage? {
        didSet {
            configureLeftView()
        }
    }

    //MARK: - Functions
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    func configure() {
        borderStyle = .none
        attributedPlaceholder = NSAttributedString(string: (isSecureTextEntry) ? "Senha" : "Login ou Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        configureLeftView()
       
        if isSecureTextEntry {
            configureRightView()
        }
        configureBottomLine()
    }
    
    func configureBottomLine() {
        let bottomView = UIView()
        self.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        bottomView.backgroundColor = .white
    }
    
    @objc func passwordSecurity(_ sender: UIButton){
        isSecureTextEntry.toggle()
        if(isSecureTextEntry){
            configureLeftView()
        }
        else
        {
            leftImageView.image = UIImage(named: "unlockedIcon")
        }
    }
    
    private func configureLeftView() {
        leftImageView.contentMode = .scaleAspectFit
        if isSecureTextEntry {
            leftImageView.image = UIImage(named: "lockIcon")
        }
        else{
            leftImageView.image = leftIcon
        }
        self.leftView = leftImageView
        leftViewMode = .always
    }
    
    private func configureRightView() {
        let button = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 20, height: 20))
        button.setImage( UIImage(named: "eyeIcon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(self.passwordSecurity(_:)), for: .touchUpInside)
        self.rightView = button
        rightViewMode = .always
    }    
}
