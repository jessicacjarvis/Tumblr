//
//  TrendingViewController.swift
//  Tumblr
//
//  Created by Jessica Jarvis on 10/9/14.
//  Copyright (c) 2014 Jessica Jarvis. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {
    
    
    //VARS
    @IBOutlet weak var trendingImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = trendingImage.image!.size

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
