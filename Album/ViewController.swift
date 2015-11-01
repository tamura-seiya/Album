//
//  ViewController.swift
//  Album
//
//  Created by tamura seiya on 2015/11/01.
//  Copyright (c) 2015年 Seiya Tamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var uiScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var v1: View1 = View1(nibName: "View1", bundle:nil)
        
        var v2: View2 = View2(nibName: "View2", bundle:nil)
        
        var v3: View3 = View3(nibName: "View3", bundle:nil)
        
        self.addChildViewController(v1)
        self.uiScrollView?.addSubview(v1.view)
        v1.didMoveToParentViewController(self)
        
        self.addChildViewController(v2)
        self.uiScrollView?.addSubview(v2.view)
        v2.didMoveToParentViewController(self)
        
        self.addChildViewController(v3)
        self.uiScrollView?.addSubview(v3.view)
        v3.didMoveToParentViewController(self)
        
        
        var v2Frame :CGRect = v2.view.frame
        v2Frame.origin.x = self.view.frame.width
        v2.view.frame = v2Frame
        
        var v3Frame :CGRect = v3.view.frame
        v3Frame.origin.x = 2 * self.view.frame.width
        v3.view.frame = v3Frame
        
        self.uiScrollView?.contentSize = CGSizeMake(self.uiScrollView.frame.width * 3, self.uiScrollView.frame.size.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}