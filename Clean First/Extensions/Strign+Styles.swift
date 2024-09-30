//
//  Strign+ProjectStyles.swift
//  Clean First
//
//  Created by Ilya Paddubny on 25.09.2024.
//

import Foundation

extension String {
    func styled(as style: TextStyle) -> NSAttributedString {
        return NSAttributedString(string: self, attributes: style.attributes)
    }
}

