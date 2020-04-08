//
//  ViewController.swift
//  SnapWar
//
//  Created by Pia Leung on 06/04/2020.
//  Copyright © 2020 stickerwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var button: PrimaryButton = PrimaryButton(label: "Button");
//    var button2: PrimaryButton = PrimaryButton(label: "Button2");
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup();
    }
    
    func setup() {
        view?.backgroundColor = Color.black
        
        let column = UIStackView();
        view.addSubview(column)
        
        column.axis = .vertical
        column.distribution = .equalSpacing
        column.alignment = .leading
        column.spacing = 20
        
        column.backgroundColor = Color.primary
        column.translatesAutoresizingMaskIntoConstraints = false
        column.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true;
        column.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true;
        column.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true;
        column.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true;
        
        
        for i in 1...5 {
            let button = PrimaryButton(label: "Button \(i)")
            column.addArrangedSubview(button)
            
        }
//        let row = UIStackView();
//        row.axis = .horizontal
//        row.heightAnchor.constraint(equalToConstant: 40).isActive = true;
//        row.addArrangedSubview(button);
//
//        column.addArrangedSubview(row)
//        column.addArrangedSubview(button)
//         column.addArrangedSubview(button2)
    }


}

