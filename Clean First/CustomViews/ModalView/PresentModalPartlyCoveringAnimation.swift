//
//  CustomPresentAnimation.swift
//  Clean First
//
//  Created by Ilya Paddubny on 30.09.2024.
//

import UIKit

class PresentModalPartlyCoveringAnimation: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3 // Duration of the animation
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to) else {
            return
        }

        let containerView = transitionContext.containerView
        let finalFrame = transitionContext.finalFrame(for: toViewController)

        // Set the initial frame so the view is off-screen (below the bottom)
        var initialFrame = finalFrame
        initialFrame.origin.y = containerView.bounds.height

        // The final height is 2/3 of the screen
        let finalHeight = containerView.bounds.height * 5 / 8
        var presentedFrame = finalFrame
        presentedFrame.size.height = finalHeight
        presentedFrame.origin.y = containerView.bounds.height - finalHeight

        // Set the initial frame
        toViewController.view.frame = initialFrame
        containerView.addSubview(toViewController.view)

        // Animate to the final position (2/3rd of the screen)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toViewController.view.frame = presentedFrame
        }, completion: { finished in
            transitionContext.completeTransition(finished)
        })
    }
}
