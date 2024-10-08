//
//  LoginViewController.swift
//  Clean First
//
//  Created by Ilya Paddubny on 16.09.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import SnapKit

protocol LoginDisplayLogic: AnyObject
{
    func displaySomething(viewModel: Login.LoginAction.ViewModel)
}

class LoginViewController: BaseModalViewController
{
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

    
    // UI Elements
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.attributedText = Constants.LoginScreen.welcome.styled(as: .headline4Bold18)
        label.textColor = .white
        return label
    }()
    
    private let instructionLabel: UILabel = {
        let label = UILabel()
        label.attributedText = Constants.LoginScreen.inputYourCredentials.styled(as: .bodyRegular14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        return label
    }()
    
    private let emailTextField = CustomTextField(label: Constants.LoginScreen.emailHint, icon: .person)
    
    private let passwordTextField = CustomTextField(label: Constants.LoginScreen.passwordHint, icon: .lock)
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton()
        let attributedTitle = Constants.LoginScreen.forgotPassword.styled(as: .bodySemiBold14)
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = RoundedButton(style: .whiteBackground)
        button.setTitle(Constants.Common.loginButtonTitle, for: .normal)
        return button
    }()
    
    private  lazy var buttonStackView = UIStackView(arrangedSubviews: [self.forgotPasswordButton, self.loginButton])

    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        setupUI()
    }
    
    
    internal override func setupUI() {
        super.setupUI()
        
        

        // Add subviews
        view.addSubview(welcomeLabel)
        view.addSubview(instructionLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
        buttonStackView = UIStackView(arrangedSubviews: [forgotPasswordButton, loginButton])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 20
        view.addSubview(buttonStackView)

        setupConstraints()
        
    }
    
    
    
    private func setupConstraints() {
        // Welcome Label
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(view).offset(20)
        }
        
        // Instruction Label
        instructionLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(22)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)

        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(instructionLabel.snp.bottom).offset(30)
            make.leading.equalTo(instructionLabel)
            make.trailing.equalTo(view).offset(-20)
        }
        
        // Password TextField
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.leading.equalTo(emailTextField)
            make.trailing.equalTo(view).offset(-20)
        }
        
        // Button Stack View
            buttonStackView.snp.makeConstraints { make in
              make.leading.equalTo(emailTextField)
              make.trailing.equalTo(emailTextField)
              make.bottom.equalTo(view).inset(60)
            }
    }
    
    
    
}


extension LoginViewController: LoginDisplayLogic {
    func displaySomething(viewModel: Login.LoginAction.ViewModel) {
        
    }
}

extension LoginViewController: UITextFieldDelegate {
    // Handle the "Return" key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()  // Dismiss the keyboard
        return true
    }
    
    // Validate as user types
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Add your validation logic here
        return true  // Or false if validation fails
    }
}


