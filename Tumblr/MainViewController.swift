//
//  MainViewController.swift
//  Tumblr
//
//  Created by Jessica Jarvis on 10/9/14.
//  Copyright (c) 2014 Jessica Jarvis. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    //VARS
    @IBOutlet weak var containerView: UIView!
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var tappedButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    @IBOutlet weak var bubbleImage: UIImageView!
    
    
    //VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeButton.selected = true
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        
        //composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
        
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        
        onTapTab(homeButton)
    
        
        //ANIMATE BUBBLE
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
            self.bubbleImage.frame.origin.y = 455
        }) { (finished) -> Void in
            
        }
        

    }

    
    
    //RANDO
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //TAB BUTTONS
    @IBAction func onTapTab(sender: AnyObject) {
        
        tappedButton = sender as UIButton
        
        homeButton.selected = false
        searchButton.selected = false
        //composeButton.selected = false
        accountButton.selected = false
        trendingButton.selected = false
        
        tappedButton.selected = true
        
        if homeButton.selected == true {
            self.addChildViewController(homeViewController)
            homeViewController.view.frame = containerView.frame
            containerView.addSubview(homeViewController.view)
            homeViewController.didMoveToParentViewController(self)
            bubbleImage.alpha = 1
        } else if searchButton.selected == true {
            self.addChildViewController(searchViewController)
            searchViewController.view.frame = containerView.frame
            containerView.addSubview(searchViewController.view)
            searchViewController.didMoveToParentViewController(self)
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.bubbleImage.alpha = 0
            })
        } /*else if composeButton.selected == true {
            self.addChildViewController(composeViewController)
            composeViewController.view.frame = containerView.frame
            containerView.addSubview(composeViewController.view)
            composeViewController.didMoveToParentViewController(self)
            bubbleImage.alpha = 1
        }*/ else if accountButton.selected == true {
            self.addChildViewController(accountViewController)
            accountViewController.view.frame = containerView.frame
            containerView.addSubview(accountViewController.view)
            accountViewController.didMoveToParentViewController(self)
            bubbleImage.alpha = 1
        } else if trendingButton.selected == true {
            self.addChildViewController(trendingViewController)
            trendingViewController.view.frame = containerView.frame
            containerView.addSubview(trendingViewController.view)
            trendingViewController.didMoveToParentViewController(self)
            bubbleImage.alpha = 1
            
            
        }
        
       
    }
    
    
    //SEGUE
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = destinationVC as ComposeViewController
        
    }

    

}
