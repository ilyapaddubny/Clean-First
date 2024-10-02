//
//  Constants.swift
//  Clean First
//
//  Created by Ilya Paddubny on 27.09.2024.
//

import Foundation

struct Constants {
    private init() {}
    
    struct Common {
        private init() {}
        static let slogan = NSLocalizedString("breed is a lifestyle", comment: "Subtitle on the start screen")
        static let iconName = "BreedShowIcon"
        static let titleImageName = "BreedShowTextDard"
        static let loginButtonTitle = NSLocalizedString("Войти", comment: "Login button text")
    }
        
    struct StartScreen {
        private init() {}
        
        static let registerButtonTitle = NSLocalizedString("Зарегистрироваться", comment: "Register button text")
        static let startScreenImageName = "MainImage"
    }
    
    struct LoginScreen {
        private init() {}
        static let forgotPassword = NSLocalizedString("Забыли пароль?", comment: "Login button text")
        static let welcome = NSLocalizedString("Добро пожаловать!", comment: "Login button text")
        static let inputYourCredentials = NSLocalizedString("Введите свои персональные данные, чтобы продолжить.", comment: "Login button text")
        static let emailHint = NSLocalizedString("Email", comment: "Login button text")
        static let passwordHint = NSLocalizedString("Пароль", comment: "Login button text")

    }
}
