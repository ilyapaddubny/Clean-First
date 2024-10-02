//
//  CustomTextFieldIcon.swift
//  Clean First
//
//  Created by Ilya Paddubny on 02.10.2024.
//

import UIKit

enum CustomTextFieldIcon {
    case lock
    case email
    case person
    
    var image: UIImage? {
        switch self {
        case .lock:
            return UIImage(systemName: "lock.fill")
        case .email:
            return UIImage(systemName: "envelope.fill")
        case .person:
            return UIImage(systemName: "person.fill")
        }
    }
}
