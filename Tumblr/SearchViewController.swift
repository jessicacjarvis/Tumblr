//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Jessica Jarvis on 10/9/14.
//  Copyright (c) 2014 Jessica Jarvis. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var loading1: UIImageView!
    @IBOutlet weak var loading2: UIImageView!
    @IBOutlet weak var loading3: UIImageView!
    @IBOutlet weak var searchView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchView.hidden = true
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
            
        var images = UIImage.animatedImageNamed("loading-", duration: 0.8)
            loading1.image = images
        delay(2, closure: { () -> () in
            self.searchView.hidden = false
            self.loading1.hidden = true
            self.loading2.hidden = true
            self.loading3.hidden = true
            
        })
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //DELAY FUNCTION
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    

}
