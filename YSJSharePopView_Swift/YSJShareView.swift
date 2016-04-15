//
//  YSJShareView.swift
//  YSJSharePopView_Swift
//
//  Created by 闫树军 on 16/4/14.
//  Copyright © 2016年 闫树军. All rights reserved.
//

import UIKit

class ShareBtn: UIButton {
    var iconImageView : UIImageView!
    var nameLabel     : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconImageView = UIImageView.init(frame: CGRectMake(10, 10, 40, 40))
        iconImageView.layer.cornerRadius = 5
        self.addSubview(iconImageView)
        
        nameLabel = UILabel.init(frame: CGRectMake(0, 55, 60, 20))
        nameLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

protocol YSJShareViewDelegate {
    func shareBtnClick(index:Int)
}


class YSJShareView: UIView {
    
    var shareViewHeight     :CGFloat!
    var _shareView          :UIView!
    var _sepWidth           :CGFloat!
    var _count              :Int = 0
    var _shareViewBackground :UIView!
    var _window             :UIWindow!
    
    var _delegate            :YSJShareViewDelegate!
    


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        _shareView = UIView.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 240))
        self.addSubview(_shareView)
        
        _shareViewBackground = UIView.init(frame: UIScreen.mainScreen().bounds)
        _shareViewBackground.backgroundColor = UIColor.clearColor()
        _shareViewBackground.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(YSJShareView.dismiss)))
        
        let cancenlBtn = UIButton.init(type: UIButtonType.Custom)
        cancenlBtn.setTitle("取消分享", forState: UIControlState.Normal)
        cancenlBtn.frame = CGRectMake(0, 240 - 40, UIScreen.mainScreen().bounds.width, 40)
        cancenlBtn.addTarget(self, action: #selector(YSJShareView.hidden), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(cancenlBtn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addItem(title:String ,withImage:UIImage){
        print(title)
        _count += 1
        _sepWidth = 20 + ((UIScreen.mainScreen().bounds.width - 280)/3 + 60)*(CGFloat(_count - 1))
        let shareBtn = ShareBtn.init(type: UIButtonType.Custom)
        shareBtn.frame = CGRectMake(0 + _sepWidth, 10, 60, 80)
        shareBtn.nameLabel.text = title
        shareBtn.iconImageView.image = withImage
        shareBtn.addTarget(self, action: #selector(YSJShareView.share(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        shareBtn.tag = 1000+_count
        if _count > 4{
            _sepWidth = 20 + ((UIScreen.mainScreen().bounds.width - 280)/3 + 60)*(CGFloat(_count - 5))
            shareBtn.frame = CGRectMake(0 + _sepWidth, 90, 60, 80)
        }

        print(shareBtn)
        _shareView.addSubview(shareBtn)
        
        
    }
    
    func show() {
        _window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        _window.windowLevel = UIWindowLevelAlert+1
        _window.backgroundColor = UIColor.clearColor()
        _window.hidden = true
        _window.userInteractionEnabled = true
        _window.addSubview(_shareViewBackground)
        _window.addSubview(self)

        _window.hidden = false
        UIView.animateWithDuration(0.2, animations: {
            self._shareViewBackground.backgroundColor = UIColor.init(white: 0.0, alpha: 0.2)
            self.frame = CGRectMake(0, UIScreen.mainScreen().bounds.size.height - 240, UIScreen.mainScreen().bounds.width, 240)
            })

    }
    
        
    func hidden() {
        UIView.animateWithDuration(0.2, animations: {
            self._shareViewBackground.backgroundColor = UIColor.init(white: 0.0, alpha: 0.0)
            self.frame = CGRectMake(0, UIScreen.mainScreen().bounds.size.height , UIScreen.mainScreen().bounds.width, 240)
            }) { (finished) in
            self._window = nil
        }

    }
    
    
    func dismiss() {
        hidden()
    }
    
    func share(btn:UIButton) {
        _delegate.shareBtnClick(btn.tag - 1001)
        hidden()
    }
    
    
    
}
