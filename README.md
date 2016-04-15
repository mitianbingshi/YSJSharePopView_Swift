# YSJSharePopView_Swift
Swift 分享 popView


1.改写自OC的项目    完成类似分享的弹出界面
2.只需要导入YSJShareView.swift
3.初始化方法  有几个按钮初始化几个  最多可显示8个
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
