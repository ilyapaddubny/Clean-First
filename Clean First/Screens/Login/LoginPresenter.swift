//
//  LoginPresenter.swift
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

protocol LoginPresentationLogic
{
  func presentSomething(response: Login.LoginAction.Response)
}

class LoginPresenter: LoginPresentationLogic
{
  weak var viewController: LoginDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Login.LoginAction.Response)
  {
//      let viewModel = Login.LoginAction.ViewModel(successMessage: <#String?#>, errorMessage: <#String?#>)
//    viewController?.displaySomething(viewModel: viewModel)
  }
}
