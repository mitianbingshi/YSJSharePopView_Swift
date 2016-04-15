//
//  ViewController.swift
//  YSJSharePopView_Swift
//
//  Created by 闫树军 on 16/4/14.
//  Copyright © 2016年 闫树军. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shareView    :YSJShareView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        shareView = YSJShareView.init(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height - 240, UIScreen.mainScreen().bounds.width, 240))
        shareView._delegate = self
        shareView.addItem("1111", withImage: UIImage())
        shareView.addItem("1111", withImage: UIImage())
        shareView.addItem("1111", withImage: UIImage())
        shareView.addItem("1111", withImage: UIImage())
        shareView.addItem("1111", withImage: UIImage())
        shareView.addItem("1111", withImage: UIImage())
        shareView.addItem("1111", withImage: UIImage())
        shareView.addItem("1111", withImage: UIImage())
        
        let btn = UIButton.init(type: UIButtonType.RoundedRect)
        btn.setTitle("show", forState: UIControlState.Normal)
        btn.frame = CGRectMake(100, 100, 100, 100)
        btn.backgroundColor = UIColor.grayColor()
        btn.addTarget(self, action: #selector(ViewController.show), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func show() {
        shareView.show()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:YSJShareViewDelegate{
    func shareBtnClick(index: Int) {
        print(index)
    }
}


