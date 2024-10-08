//
//  TextStyles.swift
//  Clean First
//
//  Created by Ilya Paddubny on 25.09.2024.
//



import UIKit

enum TextStyle {
    
    case headline1Bold26
    case headline2Bold24
    case headline3Bold20
    case headline4Bold18
    case headline4SemiBold18
    case headline5Bold16
    case headline6SemiBold14
    
    case bodyRegular24
    case bodyBold24
    case bodyRegular14
    case bodySemiBold14
    case bodySemiBold12
    case bodyRegular12
    
    case buttonBold16
    case buttonSemiBold14
    case buttonSemiBold12
    
    var attributes: [NSAttributedString.Key: Any] {
        switch self {
        case .bodyBold24:
            let font = UIFont(name: "Montserrat-Bold", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .bold)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 32 - 24
            
            return [
                .font: font,
                .paragraphStyle: paragraphStyle,
            ]
            
        case .bodyRegular14:
            let font = UIFont(name: "Montserrat-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .regular)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 24 - 14
            
            return [
                .font: font,
                .paragraphStyle: paragraphStyle,
            ]
            
        case .bodySemiBold14:
            let font = UIFont(name: "Montserrat-SemiBold", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .semibold)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 24 - 14
            
            return [
                .font: font,
                .paragraphStyle: paragraphStyle,
            ]
            
        case .bodySemiBold12:
            let font = UIFont(name: "Montserrat-SemiBold", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .semibold)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 24 - 12
            
            return [
                .font: font,
                .paragraphStyle: paragraphStyle,
            ]
            
        case .bodyRegular12:
            let font = UIFont(name: "Montserrat-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .regular)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 24 - 12
            
            return [
                .font: font,
                .paragraphStyle: paragraphStyle,
            ]
        case .bodyRegular24:
            let font = UIFont(name: "Montserrat-Regular", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .regular)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 32 - 24  // Calculate leading (assuming line height is 32)
            
            return [
                .font: font,
                .paragraphStyle: paragraphStyle,
                .kern: -0.24 // Letter spacing is -1%, so calculate -1% of font size (24 * -0.01)
            ]
        case .buttonBold16:
            let font = UIFont(name: "Montserrat-Bold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .bold)
            return [
                .font: font,
            ]
        case .buttonSemiBold14:
            let font = UIFont(name: "Montserrat-SemiBold", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .semibold)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 2
            
            return [
                .font: font,
                .paragraphStyle: paragraphStyle,
                .kern: 0
            ]
        case .buttonSemiBold12:
            let font = UIFont(name: "Montserrat-SemiBold", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .semibold)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            
            return [
                .font: font,
                .paragraphStyle: paragraphStyle,
                .kern: 0
            ]
        case .headline1Bold26:
                    let font = UIFont(name: "Montserrat-Bold", size: 26) ?? UIFont.systemFont(ofSize: 26, weight: .bold)
                    let paragraphStyle = NSMutableParagraphStyle()
                    paragraphStyle.lineSpacing = 38 - 26
                    return [
                        .font: font,
                        .paragraphStyle: paragraphStyle,
                    ]
                    
                case .headline2Bold24:
                    let font = UIFont(name: "Montserrat-Bold", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .bold)
                    let paragraphStyle = NSMutableParagraphStyle()
                    paragraphStyle.lineSpacing = 36 - 24
                    return [
                        .font: font,
                        .paragraphStyle: paragraphStyle,
                    ]

                case .headline3Bold20:
                    let font = UIFont(name: "Montserrat-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .bold)
                    let paragraphStyle = NSMutableParagraphStyle()
                    paragraphStyle.lineSpacing = 36 - 20
                    return [
                        .font: font,
                        .paragraphStyle: paragraphStyle,
                    ]

                case .headline4Bold18:
                    let font = UIFont(name: "Montserrat-Bold", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .bold)
                    let paragraphStyle = NSMutableParagraphStyle()
                    paragraphStyle.lineSpacing = 34 - 18
                    return [
                        .font: font,
                        .paragraphStyle: paragraphStyle,
                    ]
                    
                case .headline4SemiBold18:
                    let font = UIFont(name: "Montserrat-SemiBold", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .semibold)
                    let paragraphStyle = NSMutableParagraphStyle()
                    paragraphStyle.lineSpacing = 34 - 18
                    return [
                        .font: font,
                        .paragraphStyle: paragraphStyle,
                    ]
                    
                case .headline5Bold16:
                    let font = UIFont(name: "Montserrat-Bold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .bold)
                    let paragraphStyle = NSMutableParagraphStyle()
                    paragraphStyle.lineSpacing = 34 - 16
                    return [
                        .font: font,
                        .paragraphStyle: paragraphStyle,
                    ]
                    
                case .headline6SemiBold14:
                    let font = UIFont(name: "Montserrat-SemiBold", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .semibold)
                    let paragraphStyle = NSMutableParagraphStyle()
                    paragraphStyle.lineSpacing = 24 - 14
                    return [
                        .font: font,
                        .paragraphStyle: paragraphStyle,
                    ]
        }
    }
}

