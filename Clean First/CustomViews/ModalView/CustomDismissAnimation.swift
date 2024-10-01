//
//  CustomDismissAnimation.swift
//  Clean First
//
//  Created by Ilya Paddubny on 30.09.2024.
//

import UIKit

class CustomDismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3 // Duration of the animation
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from) else {
            return
        }

        let containerView = transitionContext.containerView
        let finalFrame = fromViewController.view.frame

        // Set the final frame off the screen (below the bottom)
        var dismissedFrame = finalFrame
        dismissedFrame.origin.y = containerView.bounds.height

        // Animate to the final frame
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromViewController.view.frame = dismissedFrame
        }, completion: { finished in
            fromViewController.view.removeFromSuperview()
            transitionContext.completeTransition(finished)
        })
    }
}

