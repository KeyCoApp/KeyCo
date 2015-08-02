//
//  OnboardingContentViewController.swift
//  keyboard
//
//  Created by Jorge Raul Ovalle Zuleta on 7/28/15.
//  Copyright (c) 2015 j0rgitoPr0ductions. All rights reserved.
//

import UIKit
import Spring

class OnboardingContentViewController: UIViewController {
    let kDefaultOnboardingFont: String = "Menlo-Regular"
    let kDefaultTextColor: UIColor = UIColor.whiteColor()
    let kContentWidthMultiplier: CGFloat = 0.9
    let kDefaultImageViewSize: CGFloat = 100
    let kDefaultTopPadding: CGFloat = 60
    let kDefaultUnderIconPadding: CGFloat = 30
    let kDefaultUnderTitlePadding: CGFloat = 30
    let kDefaultBottomPadding: CGFloat = 0;
    let kDefaultTitleFontSize: CGFloat = 18
    let kDefaultBodyFontSize: CGFloat = 28
    let kDefaultActionButtonHeight: CGFloat = 50
    let kDefaultMainPageControlHeight: CGFloat = 35
    let titleText: String
    let body: String
    let image: UIImage
    let action: dispatch_block_t?
    let index: Int
    
    var fontName: String
    var titleFontSize: CGFloat
    var bodyFontSize: CGFloat
    var topPadding: CGFloat
    var underIconPadding: CGFloat
    var underTitlePadding: CGFloat
    var bottomPadding: CGFloat
    var titleTextColor: UIColor
    var bodyTextColor: UIColor
    var buttonTextColor: UIColor
    
    var animate:[UIView]!
    
    
    init(title: String?, body: String?, image: UIImage?, index:Int?, action: dispatch_block_t?) {
        // setup the optional initializer parameters if they were passed in or not
        self.titleText = title != nil ? title! : String()
        self.index     = index != nil ? index! : Int()
        self.body      = body != nil ? body! : String()
        self.image     = image != nil ? image! : UIImage()
        self.action    = action != nil ? action : {}
        // setup the initial default properties
        
        self.fontName = kDefaultOnboardingFont;
        self.bodyFontSize = kDefaultBodyFontSize;
        self.titleFontSize = kDefaultTitleFontSize;
        self.topPadding = kDefaultTopPadding;
        self.underIconPadding = kDefaultUnderIconPadding;
        self.underTitlePadding = kDefaultUnderTitlePadding;
        self.bottomPadding = kDefaultBottomPadding;
        self.titleTextColor = kDefaultTextColor;
        self.bodyTextColor = kDefaultTextColor;
        self.buttonTextColor = kDefaultTextColor;
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateView()
    }
    
    func generateView() {
        self.view.backgroundColor = UIColor.clearColor()
        let viewWidth: CGFloat = CGRectGetWidth(self.view.frame)
        let horizontalCenter: CGFloat = viewWidth / 2
        let contentWidth: CGFloat = viewWidth * kContentWidthMultiplier
        self.animate = []
        
        var q:CGFloat = 100
        
        var titleLabel: UILabel = UILabel(frame: CGRectMake(0, q + self.underIconPadding, contentWidth, 0))
        titleLabel.text = self.titleText
        titleLabel.font = UIFont(name: self.fontName, size: self.titleFontSize)
        titleLabel.textColor = self.titleTextColor
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .Center
        titleLabel.alpha =  0
        titleLabel.sizeToFit()
        titleLabel.center = self.view.center
        self.view.addSubview(titleLabel)
        
        
        switch self.index{
            case 0:
                var imageView: UIImageView = UIImageView(image: self.image)
                imageView.frame = CGRectMake(horizontalCenter - (167 / 2), self.topPadding, 167, 49)
                imageView.alpha = 0.8
                self.view.addSubview(imageView)
                q = CGRectGetMaxY(imageView.frame)
            case 1:
                let keyView: UIImageView = UIImageView(image: UIImage(named: "key"))
                keyView.frame = CGRectMake(horizontalCenter - (241 / 2), self.topPadding, 241, 200)
                keyView.alpha = 0.0
                keyView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
                keyView.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 50)
                self.view.addSubview(keyView)
                self.animate.append(keyView)
                
                let keyUp: UIImageView = UIImageView(image: UIImage(named: "keyup"))
                keyUp.frame = CGRectMake(horizontalCenter - (241 / 2), self.topPadding, 241, 58)
                keyUp.alpha = 0
                keyUp.center.x = self.view.center.x
                keyUp.frame.origin.y = keyView.frame.origin.y - 68
                self.view.addSubview(keyUp)
                self.animate.append(keyUp)
                
                let keyDown: UIImageView = UIImageView(image: UIImage(named: "keydown"))
                keyDown.frame = CGRectMake(horizontalCenter - (136 / 2), self.topPadding, 136, 47)
                keyDown.alpha = 0
                keyDown.center.x = self.view.center.x + 8
                keyDown.frame.origin.y = keyView.frame.maxY + 10
                self.view.addSubview(keyDown)
                self.animate.append(keyDown)
                
                titleLabel.frame.origin.y = keyUp.frame.origin.y - 60
            break
            case 2:break
            default:break
        }
        self.animate.append(titleLabel)
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        var counter:Double = 0
        for key in self.animate{
            springWithDelay(1, counter * 0.3, {
                (key as UIView).alpha = 0.7
            })
            counter = counter == 1 ? 1 : 2
        }
    }
    
    func handleButtonPressed() {
        self.action!()
    }
    
}