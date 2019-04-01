//
//  LabelStatusCustom.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 31/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

class BorderedLabel: UILabel {
   
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func configure() {
        layer.borderWidth = 1
        clipsToBounds = true
        layer.cornerRadius = frame.height / 4
    }
}
