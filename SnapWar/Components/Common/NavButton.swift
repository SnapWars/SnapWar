//
//  NavButton.swift
//  SnapWar
//
//  Created by Pia Leung on 09/04/2020.
//  Copyright © 2020 stickerwar. All rights reserved.
//

import UIKit

class NavButton: UIButton {
    required init(label: String) {
        super.init(frame: .zero)
        setupStyles()

        setTitle(label, for: .normal)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStyles()

        setTitle("Nav Button", for: .normal)
    }

    func setupStyles() {
        backgroundColor = ColorType.primary
        setTitleColor(ColorType.white, for: .normal)

    }

    func onClick() {


    }
}


