//
//  CustomTextField.swift
//  Clean First
//
//  Created by Ilya Paddubny on 02.10.2024.
//

import UIKit

// CustomTextField.swift

//typealias ValidationClosure = (String?) -> (String?, Bool)

class CustomTextField: UIView {
    //  private var validationClosure: ValidationClosure?
    
    // UI Elements
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let validationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .red
        label.numberOfLines = 2
        label.isHidden = true
        return label
    }()
    
    private var textFieldIcon: CustomTextFieldIcon?
    
    // Initializer
    init(label: String, icon: CustomTextFieldIcon) {
        super.init(frame: .zero)
        self.textFieldIcon = icon
        setupUI()
        setTitle(label)
        setIcon(icon)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Set the title of the field
    private func setTitle(_ title: String) {
        titleLabel.text = title.uppercased()
    }
    
    // Set the icon of the field
    private func setIcon(_ icon: CustomTextFieldIcon) {
        iconImageView.image = icon.image
    }

    // Method to display validation errors or success feedback
    func displayValidationFeedback(_ message: String?, isError: Bool) {
        if let message = message {
            validationLabel.text = message
            validationLabel.textColor = isError ? .red : .green
            validationLabel.isHidden = false
        } else {
            validationLabel.isHidden = true
        }
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(textField)
        addSubview(validationLabel)
        
        // Constraints for titleLabel
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        // Constraints for textField
        textField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(48)
        }
        
        // Constraints for validationLabel
        validationLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        // Padding for the text field to accommodate the icon
        textField.rightView = iconImageView
        textField.rightViewMode = .whileEditing
        textField.leftView?.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
    }
    
    var delegate: UITextFieldDelegate? {
        get {
            return textField.delegate
        }
        set {
            textField.delegate = newValue
        }
    }
    
    
}


