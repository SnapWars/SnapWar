//
//  ColumnView.swift
//  SnapWar
//
//  Created by Pia Leung on 08/04/2020.
//  Copyright © 2020 stickerwar. All rights reserved.
//

import UIKit

class ColumnView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        alignment = .fill
        distribution = .fill
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
