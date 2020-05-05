import UIKit

class SWUserSettingsForm: UIStackView {
    let notificationsSwitch = SWSwitch()
    let isNotificationsEnabled = false;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    fileprivate func setup() {
        axis = .vertical
        alignment = .fill
        distribution = .equalCentering
        translatesAutoresizingMaskIntoConstraints = false
        
        let notificationRow = createFieldRow(label: "Allow notifications")
        notificationRow.addArrangedSubview(notificationsSwitch)
        
        addArrangedSubview(notificationRow)
    }
    
    fileprivate func createFieldRow(label labelText: String) -> UIStackView {
        let row = UIStackView()
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
