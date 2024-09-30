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
    }
        
    struct StartScreen {
        private init() {}
        static let loginButtonTitle = NSLocalizedString("Войти", comment: "Login button text")
        static let registerButtonTitle = NSLocalizedString("Зарегистрироваться", comment: "Register button text")
        static let startScreenImageName = "MainImage"
    }
    
}
