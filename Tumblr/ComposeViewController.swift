//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Jessica Jarvis on 10/9/14.
//  Copyright (c) 2014 Jessica Jarvis. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    //VARS
    @IBOutlet var mainView: UIView!
    var isPresenting: Bool = true
    @IBOutlet weak var whiteButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var grayButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SETTING BACKGROUND COLOR & TRANS
        mainView.backgroundColor = UIColor(red: 0.20, green: 0.27, blue: 0.36, alpha: 0.6)
        
        whiteButton.frame.origin.x = 24
        whiteButton.frame.origin.y = view.frame.height + 300
        
        redButton.frame.origin.x = 124
        redButton.frame.origin.y = view.frame.height + 500
        
        orangeButton.frame.origin.x = 224
        orangeButton.frame.origin.y = view.frame.height + 300
        
        greenButton.frame.origin.x = 24
        greenButton.frame.origin.y = view.frame.height + 450
        
        blueButton.frame.origin.x = 124
        blueButton.frame.origin.y = view.frame.height + 650
        
        grayButton.frame.origin.x = 224
        grayButton.frame.origin.y = view.frame.height + 450
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //HIT NEVERMIND
    @IBAction func onNevermindButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    //CUSTOM
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
        return 0.9
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.9, animations: { () -> Void in
                toViewController.view.alpha = 1
                
                self.whiteButton.frame.origin.x = 24
                self.whiteButton.frame.origin.y = 148
                
                self.redButton.frame.origin.x = 124
                self.redButton.frame.origin.y = 148
                
                self.orangeButton.frame.origin.x = 224
                self.orangeButton.frame.origin.y = 148
                
                self.greenButton.frame.origin.x = 24
                self.greenButton.frame.origin.y = 288
                
                self.blueButton.frame.origin.x = 124
                self.blueButton.frame.origin.y = 288
                
                self.grayButton.frame.origin.x = 224
                self.grayButton.frame.origin.y = 288
                
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.9, animations: { () -> Void in
                fromViewController.view.alpha = 0
                
                self.whiteButton.frame.origin.x = 24
                self.whiteButton.frame.origin.y = -600
                
                self.redButton.frame.origin.x = 124
                self.redButton.frame.origin.y = -800
                
                self.orangeButton.frame.origin.x = 224
                self.orangeButton.frame.origin.y = -600
                
                self.greenButton.frame.origin.x = 24
                self.greenButton.frame.origin.y = -450
                
                self.blueButton.frame.origin.x = 124
                self.blueButton.frame.origin.y = -650
                
                self.grayButton.frame.origin.x = 224
                self.grayButton.frame.origin.y = -450
                
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }

    
    
    

}