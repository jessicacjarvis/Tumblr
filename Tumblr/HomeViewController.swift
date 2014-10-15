//
//  HomeViewController.swift
//  Tumblr
//
//  Created by Jessica Jarvis on 10/9/14.
//  Copyright (c) 2014 Jessica Jarvis. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //VARS
    var isPresenting: Bool = true

    
    //DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //SEGUE
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = destinationVC as LoginViewController
        
    }
    
    
    
    
}
