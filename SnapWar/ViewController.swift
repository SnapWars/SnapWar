//
//  ViewController.swift
//  SnapWar
//
//  Created by Pia Leung on 06/04/2020.
//  Copyright © 2020 stickerwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup();
    }
    
    func setup() {
        view?.backgroundColor = ColorTypes.black
        
        let column = UIStackView();
        view.addSubview(column)
        
        column.axis = .vertical
        column.distribution = .fillEqually
        column.alignment = .fill
        column.spacing = 5
        
        column.backgroundColor = ColorTypes.primary
        column.translatesAutoresizingMaskIntoConstraints = false
        column.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true;
        column.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true;
        column.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true;
        column.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true;
        

        for route in NavTypes {
            let button = NavButton(label: route.name)
            button.controller = route.controller
            button.addTarget(self, action:  #selector(toController), for: .touchUpInside)

            column.addArrangedSubview(button)
            
        }
    }
    
    @IBAction func toController(sender: NavButton) {
        if let controller = sender.controller {
            navigationController?.pushViewController(controller, animated: true)
        }
        
        
    }


}

