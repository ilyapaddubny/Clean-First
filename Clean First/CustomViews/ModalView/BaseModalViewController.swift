//
//  BaseModalViewController.swift
//  Clean First
//
//  Created by Ilya Paddubny on 01.10.2024.
//

import UIKit

class BaseModalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupPanGesture()
    }
    
    // MARK: - Common UI Setup
    func setupUI() {
        view.backgroundColor = .primary1
        view.layer.cornerRadius = 32
        // Mask only the top left and top right corners
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    // MARK: - Swipe to Dismiss Gesture
    private func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        view.addGestureRecognizer(panGesture)
    }

    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)

        switch gesture.state {
        case .changed:
            if translation.y > 0 { // Only allow downward swiping
                view.transform = CGAffineTransform(translationX: 0, y: translation.y)
            }
        case .ended:
            if translation.y > 200 { // If the swipe is significant (threshold)
                dismiss(animated: true, completion: nil)
            } else {
                // Animate back to original position if the swipe is too small
                UIView.animate(withDuration: 0.3) {
                    self.view.transform = .identity
                }
            }
        default:
            break
        }
    }
}

