import UIKit
import SCSDKBitmojiKit

class SWAccountViewController: UIViewController {
    let displayName = UILabel()
    let avatar = SWAvatar()
    let settingsColumn = UIStackView()
    let notificationsSwitch = SWSwitch()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    fileprivate func setup() {
        view?.backgroundColor = SWColorType.white
        view.addSubview(avatar)
        view.addSubview(displayName)
        view.addSubview(settingsColumn)

        setupSettings()
        
        displayName.text = SWUserEntity.instance.displayName
        displayName.textColor = SWColorType.black
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        displayName.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            displayName.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            displayName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatar.widthAnchor.constraint(equalToConstant: 150),
            avatar.heightAnchor.constraint(equalToConstant: 150),
            avatar.bottomAnchor.constraint(equalTo: displayName.topAnchor, constant: -10),
            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingsColumn.topAnchor.constraint(equalTo: displayName.bottomAnchor, constant: 10),
            settingsColumn.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsColumn.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    fileprivate func setupSettings() {
        settingsColumn.axis = .vertical
        settingsColumn.alignment = .fill
        settingsColumn.distribution = .equalCentering
        settingsColumn.translatesAutoresizingMaskIntoConstraints = false
        
        let notificationRow = createFieldRow(label: "Allow notifications")
        notificationRow.addArrangedSubview(notificationsSwitch)
        notificationRow.translatesAutoresizingMaskIntoConstraints = false
        
        settingsColumn.addArrangedSubview(notificationRow)
        
    }
    
    fileprivate func createFieldRow(label labelText: String) -> UIStackView {
        let row = UIStackView();
        row.axis = .horizontal
        row.alignment = .center
        row.distribution = .equalSpacing
        row.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        row.isLayoutMarginsRelativeArrangement = true
        row.translatesAutoresizingMaskIntoConstraints = false
        

        let label = UILabel()
        label.text = labelText
        row.addArrangedSubview(label)
        
        return row;
    }
}
