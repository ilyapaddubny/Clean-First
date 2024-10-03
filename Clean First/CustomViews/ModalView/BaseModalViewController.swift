//
//  BaseModalViewController.swift
//  Clean First
//
//  Created by Ilya Paddubny on 01.10.2024.
//

import UIKit

class BaseModalViewController: UIViewController {
    
    var isViewMovedUp = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register for keyboard notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
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
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// Extension to handle keyboard events
extension BaseModalViewController {
    
    // This method is triggered when the keyboard is about to appear.
    // It adjusts the view's position so that the text fields aren't covered by the keyboard.
    @objc func keyboardWillShow(notification: NSNotification) {
        print("ℹ️ keyboardWillShow")
        if let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            print("ℹ️ if let keyboardSize...")
            let keyboardFrame = keyboardSize.cgRectValue.height
            
            // Adjust the view's frame or constraints to move up by the keyboard height
            if !isViewMovedUp {
                print("ℹ️ Moving view up by keyboard height")
                self.view.frame.origin.y -= keyboardFrame
                isViewMovedUp = true
            }
        }
    }

    // This method is triggered when the keyboard is about to disappear.
    // It resets the view's position to its original state after the keyboard hides.
    @objc func keyboardWillHide(notification: NSNotification) {
        print("ℹ️ keyboardWillHide")
        // Reset the view's position when the keyboard disappears
        if let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            print("ℹ️ if let keyboardSize...")
            let keyboardFrame = keyboardSize.cgRectValue.height
            
            // Adjust the view's frame or constraints to move up by the keyboard height
            if isViewMovedUp {
                print("ℹ️ Moving view up by keyboard height")
                self.view.frame.origin.y += keyboardFrame
                isViewMovedUp = false
            }
        }
    }
}
