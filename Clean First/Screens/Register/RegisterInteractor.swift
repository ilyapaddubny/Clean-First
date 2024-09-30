//
//  RegisterInteractor.swift
//  Clean First
//
//  Created by Ilya Paddubny on 27.09.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RegisterBusinessLogic
{
  func doSomething(request: Register.Something.Request)
}

protocol RegisterDataStore
{
  //var name: String { get set }
}

class RegisterInteractor: RegisterBusinessLogic, RegisterDataStore
{
  var presenter: RegisterPresentationLogic?
  var worker: RegisterWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Register.Something.Request)
  {
    worker = RegisterWorker()
    worker?.doSomeWork()
    
    let response = Register.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
