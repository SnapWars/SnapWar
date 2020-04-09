//
//  NavTypes.swift
//  SnapWar
//
//  Created by Pia Leung on 09/04/2020.
//  Copyright © 2020 stickerwar. All rights reserved.
//

import UIKit

struct NavType {
    let name: String
    let controller: UIViewController
}

var NavTypes: [NavType] = [
   NavType(name: "Auth", controller: AuthViewController()),
   NavType(name: "Gallery", controller: GalleryViewController()),
   NavType(name: "Create War", controller: CreateWarViewController()),
]

