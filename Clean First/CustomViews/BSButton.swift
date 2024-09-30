//
//  BSButton.swift
//  Clean First
//
//  Created by Ilya Paddubny on 25.09.2024.
//

import UIKit

// Custom UIButton class
class RoundedButton: UIButton {
    
    enum ButtonStyle {
        case blueBackground
        case whiteBackground
    }
    
    init(style: ButtonStyle) {
        super.init(frame: .zero)
        setupButton(with: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupButton(with style: ButtonStyle) {
        layer.cornerRadius = 25
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        clipsToBounds = true
        
        switch style {
        case .blueBackground:
            backgroundColor = UIColor(named: "Primary1")
            setTitleColor(UIColor(named: "Neutrals8"), for: .normal)
        case .whiteBackground:
            backgroundColor = UIColor.white
            setTitleColor(UIColor.systemBlue, for: .normal)
            layer.borderWidth = 2
            layer.borderColor = UIColor.systemBlue.cgColor
        }
    }
    
    func setTitle(_ title: String) {
        let attributedTitle = title.styled(as: .buttonBold16)
        setAttributedTitle(attributedTitle, for: .normal)
    }
}
