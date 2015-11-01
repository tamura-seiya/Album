//
//  TinderController.swift
//  Album
//
//  Created by tamura seiya on 2015/11/01.
//  Copyright (c) 2015年 Seiya Tamura. All rights reserved.
//

import UIKit

class TinderController: UIViewController, MDCSwipeToChooseDelegate{
    
    var imageArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createImage()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //画像を生成する
    func createImage(){
        var options = MDCSwipeToChooseViewOptions()
        options.delegate = self
        options.likedText = "Keep"
        options.likedColor = UIColor.blueColor()
        options.nopeText = "Delete"
        options.onPan = { state -> Void in
            if state.thresholdRatio == 1 && state.direction == MDCSwipeDirection.Left {
                println("Photo deleted!")
            }
        }
        
        
        var view = MDCSwipeToChooseView(frame: self.view.bounds, options: options)
        //        view.imageView.image = UIImage(named: "photo.png")
        self.view.addSubview(view)
        
        
    }
    
    //cancellのときの対応
    func viewDidCancelSwipe(view: UIView) -> Void{
        println("Couldn't decide, huh?")
    }
    
    //左か右のどちらかに傾き切ったら、どちらを選択したのか確定
    func view(view: UIView, shouldBeChosenWithDirection: MDCSwipeDirection) -> Bool{
        if (shouldBeChosenWithDirection == MDCSwipeDirection.Left) {
            return true;
        } else {
            // Snap the view back and cancel the choice.
            UIView.animateWithDuration(0.16, animations: { () -> Void in
                view.transform = CGAffineTransformIdentity
                view.center = view.superview!.center
            })
            return false;
        }
    }
    
    //左か右、どちらを選択したのか確定したら呼ばれるメソッド
    func view(view: UIView, wasChosenWithDirection: MDCSwipeDirection) -> Void{
        if wasChosenWithDirection == MDCSwipeDirection.Left {
            println("Photo deleted!")
        }else{
            println("Photo saved!")
        }
    }
    
    
}

