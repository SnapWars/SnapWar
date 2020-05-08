import UIKit

class SWTabBar: UITabBar {
    
    required init(tabs: [SWTabBarItem]) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        setup(tabs: tabs)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup(tabs: [SWTabBarItem]) {
        setupTabs(tabs: tabs)
        setupStyles()
    }
    
    fileprivate func setupTabs(tabs: [SWTabBarItem]) {
        let row = UIStackView()
        addSubview(row)
        row.axis = .horizontal
        row.distribution = .fillEqually
        row.alignment = .fill
        row.translatesAutoresizingMaskIntoConstraints = false
        
        for tab in tabs {
            row.addArrangedSubview(tab)
        }
        
        NSLayoutConstraint.activate([
            row.leadingAnchor.constraint(equalTo: leadingAnchor),
            row.trailingAnchor.constraint(equalTo: trailingAnchor),
            row.topAnchor.constraint(equalTo: topAnchor),
            row.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    fileprivate func setupStyles() {
        backgroundColor = UIColor.white
        
    }

}
