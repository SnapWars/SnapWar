//
//  RowView.swift
//  SnapWar
//
//  Created by Pia Leung on 08/04/2020.
//  Copyright © 2020 stickerwar. All rights reserved.
//

import UIKit

class RowView: UIStackView {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        axis = .horizontal
        alignment = .fill
        distribution = .fill
    }
    
}
