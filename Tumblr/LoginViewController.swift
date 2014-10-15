//
//  LoginViewController.swift
//  Tumblr
//
//  Created by Jessica Jarvis on 10/11/14.
//  Copyright (c) 2014 Jessica Jarvis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    //VARS
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    var isPresenting: Bool = true
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //SETTING BACKGROUND COLOR & ALPHA
        view.backgroundColor = UIColor(red: 0.20, green: 0.27, blue: 0.36, alpha: 0.6)
        
    }
    
    override func viewDidAppear(animated: Bool) {
    }
    

    @IBAction func onCancelButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    //RANDO
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    self.emailTextField.becomeFirstResponder()
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }

}




}

