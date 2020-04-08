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
        setup(label: label)
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup(label: "Primary Button")
    }
    
    func setup(label: String) {
        backgroundColor = Color.primary
        setTitleColor(Color.white, for: .normal)
        layer.cornerRadius = 25
        setTitle(label, for: .normal)
    }
}

