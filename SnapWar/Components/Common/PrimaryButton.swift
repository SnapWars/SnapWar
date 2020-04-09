//
//  CustomButton.swift
//  SnapWar
//
//  Created by Pia Leung on 06/04/2020.
//  Copyright © 2020 stickerwar. All rights reserved.
//

import UIKit

class PrimaryButton: UIButton {
    
    required init(label: String) {
        super.init(frame: .zero)
        
        setupStyles()
        setTitle(label, for: .normal)
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupStyles()
        setTitle("Primary Button", for: .normal)
    }
    
    func setupStyles() {
        backgroundColor = ColorTypes.primary
        setTitleColor(ColorTypes.white, for: .normal)
        layer.cornerRadius = 25
        
    }
}

