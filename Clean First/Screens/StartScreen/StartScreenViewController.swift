import UIKit
import SnapKit

protocol StartScreenDisplayLogic: AnyObject {
    func displayLoginScreen(viewModel: StartScreen.Login.ViewModel)
    func displayRegisterScreen(viewModel: StartScreen.Register.ViewModel)
    
}

class StartScreenViewController: UIViewController, UIViewControllerTransitioningDelegate {
    var interactor: StartScreenBusinessLogic?
    var router: (NSObjectProtocol & StartScreenRoutingLogic & StartScreenDataPassing)?
    
    // UI Elements
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.Common.iconName)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.Common.titleImageName)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = Constants.Common.slogan.styled(as: .bodySemiBold14)
        label.textColor = .neutrals5
        label.textAlignment = .center
        label.numberOfLines = 0 
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let catImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.StartScreen.startScreenImageName)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let loginButton: UIButton = {
        let button = RoundedButton(style: .blueBackground)
        button.setTitle(Constants.StartScreen.loginButtonTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = RoundedButton(style: .blueBackground)
        button.setTitle(Constants.StartScreen.registerButtonTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
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
    
    private func setup()
    {
        let viewController = self
        let interactor = StartScreenInteractor()
        let presenter = StartScreenPresenter()
        let router = StartScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func setupUI() {
        
        view.backgroundColor = .white

        view.addSubview(appIconImageView)
        view.addSubview(titleImageView)
        view.addSubview(subtitleLabel)
        view.addSubview(catImageView)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        
        appIconImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(74)
            
        }
        
        titleImageView.snp.makeConstraints { make in
            make.top.equalTo(appIconImageView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(24.5)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleImageView.snp.bottom).offset(22)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        catImageView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview() // Equivalent to leading/trailing 0
            make.height.equalTo(catImageView.snp.width)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(registerButton.snp.top).offset(-20)
            make.width.equalTo(260)
            make.height.equalTo(50)
        }
        
        registerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.width.equalTo(260)
            make.height.equalTo(50)
        }
    }
    
    @objc private func loginButtonTapped() {
        let request = StartScreen.Login.Request()
        interactor?.login(request: request)
    }
    
    @objc private func registerButtonTapped() {
        let request = StartScreen.Register.Request()
        interactor?.register(request: request)
    }
    
    
}


extension StartScreenViewController: StartScreenDisplayLogic {
    
    func displayLoginScreen(viewModel: StartScreen.Login.ViewModel) {
        router?.routeToLogin()
    }
    
    func displayRegisterScreen(viewModel: StartScreen.Register.ViewModel) {
        router?.routeToRegister()
    }
}
