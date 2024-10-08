//
//  StartScreenRouter.swift
//  Clean First
//
//  Created by Ilya Paddubny on 24.09.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol StartScreenRoutingLogic {
    func routeToLogin()
    func routeToRegister()
}

protocol StartScreenDataPassing {
    var dataStore: StartScreenDataStore? { get }
}

class StartScreenRouter: NSObject, StartScreenRoutingLogic, StartScreenDataPassing, UIViewControllerTransitioningDelegate {
    
    weak var viewController: StartScreenViewController?
    var dataStore: StartScreenDataStore?
    
    private enum Route {
            case login
            case register
        }
    private var currentRoute: Route?

    
    // MARK: - Routing to Login Screen
    func routeToLogin() {
        let loginVC = LoginViewController()
        currentRoute = .login
        navigateToLogin(source: viewController!, destination: loginVC)
    }
    
    // MARK: - Routing to Register Screen
    func routeToRegister() {
        let registerVC = RegisterViewController()
        currentRoute = .register
        navigateToRegister(source: viewController!, destination: registerVC)
        
    }
    
    // MARK: - Navigation Methods
    
    private func navigateToLogin(source: StartScreenViewController, destination: BaseModalViewController) {
        //        source.navigationController?.pushViewController(destination, animated: true)
        destination.modalPresentationStyle = .custom
        destination.transitioningDelegate = self
        source.present(destination, animated: true, completion: nil)
    }
    
    private func navigateToRegister(source: StartScreenViewController, destination: BaseModalViewController) {
        //        source.navigationController?.pushViewController(destination, animated: true)
        destination.modalPresentationStyle = .custom
        destination.transitioningDelegate = self
        source.present(destination, animated: true, completion: nil)
    }
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch currentRoute {
                case .login:
                    return PresentModalPartlyCoveringAnimation() // Use login animation
                case .register:
                    return PresentModalFullScreenAnimation() // Use register animation
                default:
                    return nil
                }
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomDismissAnimation()
    }
}
