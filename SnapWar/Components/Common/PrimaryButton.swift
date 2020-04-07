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
        self.setTitle(label, for: .normal)
        self.backgroundColor = Color.primary
        self.setTitleColor(Color.white, for: .normal)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

