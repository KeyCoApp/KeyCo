//
//  KeyboardViewController.swift
//  CustomKeyboard
//
//  Created by p4bloch on 7/25/15.
//  Copyright (c) 2015 j0rgitoPr0ductions. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!

    let portraitHeight: CGFloat = 250
    let landscapeHeight: CGFloat = 203.0
    var heightConstraint: NSLayoutConstraint?
    var proxy: UITextDocumentProxy!
    var keyboard: Keyboard!
    var upper: Bool = false
    var numeric: Bool = false
    var keymap = [["=", "_"],
                  ["{", "}"],
                  ["[", "]"],
                  ["(", ")"],
                  ["/", "\\"],
                  ["&", "|"],
                  ["<", ">"],
                  ["+", "-"],
                  ["*", "^"],
                  ["\"", "'"],
                  [".", ":"],
                  [",", ";"],
                  ["?", "!"]]

    override func updateViewConstraints() {
        super.updateViewConstraints()
//        // Add custom view sizing constraints here
//        if (self.view.frame.size.width == 0 || self.view.frame.size.height == 0) {
//            return
//        }
//
//        proxy = textDocumentProxy as! UITextDocumentProxy
//
//        inputView.removeConstraint(heightConstraint!)
//        let screenSize = UIScreen.mainScreen().bounds.size
//        let screenH = screenSize.height;
//        let screenW = screenSize.width;
//        let isLandscape =  !(self.view.frame.size.width == screenW *
        //((screenW < screenH) ? 1 : 0) + screenH * ((screenW > screenH) ? 1 : 0))
//        NSLog(isLandscape ? "Screen: Landscape" : "Screen: Potriaint");
//        if (isLandscape) {
//            heightConstraint!.constant = landscapeHeight;
//            inputView.addConstraint(heightConstraint!)
//        } else {
//            heightConstraint!.constant = self.portraitHeight;
//            inputView.addConstraint(heightConstraint!)
//        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor(hue:0, saturation:0, brightness:0.13, alpha:1)
//        keyboard = NSBundle.mainBundle().loadNibNamed("Keyboard", owner: nil, options: nil)[0] as! Keyboard
//        keyboard.frame = view.frame
//        self.view.addSubview(keyboard)
//        self.addGestures(keyboard)
//
//        for button in keyboard.subviews{
//            (button as! UIButton).layer.borderColor = UIColor(hue:0, saturation:0, brightness:0.13, alpha:1).CGColor
//            (button as! UIButton).layer.borderWidth = 2
//        }
//
//        heightConstraint = NSLayoutConstraint(item: self.inputView,
        //attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal,
        //toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: portraitHeight)
//        heightConstraint!.priority = 999.0
    }

    func addGestures(keyboard: Keyboard) {
//        keyboard.back.addTarget(self,    action: Selector("pressDeleteKey"), forControlEvents: .TouchUpInside)
//        let gesture = UILongPressGestureRecognizer(target: self, action: Selector("longBack"))
//        gesture.minimumPressDuration = 0.3
//        keyboard.back.addGestureRecognizer(gesture)
//        keyboard.space.addTarget(self,   action: Selector("pressSpaceKey"), forControlEvents: .TouchUpInside)
//        keyboard.shift.addTarget(self,   action: Selector("pressShiftKey"), forControlEvents: .TouchUpInside)
//        keyboard.numeric.addTarget(self, action: Selector("pressNumKey"), forControlEvents: .TouchUpInside)
//        keyboard.enter.addTarget(self,   action: Selector("pressReturnKey"), forControlEvents: .TouchUpInside)
//        keyboard.globe.addTarget(self,   action: Selector("advanceToNextInputMode"), forControlEvents: .TouchUpInside)
//
//        for letter in keyboard.letters{
//            letter.addTarget(self, action: Selector("pressLetter:"), forControlEvents: .TouchUpInside)
//        }
//
//        for special in keyboard.specials{
//            special.addTarget(self, action: Selector("pressLetter:"), forControlEvents: .TouchUpInside)
//            let gesture = UILongPressGestureRecognizer(target: self, action: Selector("longSpecial:"))
//            gesture.minimumPressDuration = 0.3
//            special.addGestureRecognizer(gesture)
//        }
    }

    func pressLetter(sender: UIButton) {
        proxy.insertText(sender.currentTitle!)
    }

    func longBack() {
        proxy.deleteBackward()
    }

    func pressDeleteKey() {
        proxy.deleteBackward()
    }

    func pressSpaceKey() {
        proxy.insertText(" ")
    }

    func pressShiftKey() {
//        if upper {
//            for letter in keyboard.letters{
//                letter.setTitle(letter.currentTitle?.lowercaseString, forState: .Normal)
//            }
//            keyboard.shift.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.08)
//            keyboard.shift.tintColor = UIColor(hue:0.98, saturation:0.72, brightness:0.87, alpha:1)
//        }else{
//            for letter in keyboard.letters{
//                letter.setTitle(letter.currentTitle?.uppercaseString, forState: .Normal)
//            }
//            keyboard.shift.backgroundColor = UIColor(hue:0.98, saturation:0.72, brightness:0.87, alpha:1)
//            keyboard.shift.tintColor = UIColor(hue:0, saturation:0, brightness:0.13, alpha:1)
//        }
//        upper = !upper
    }

    func longSpecial(sender: UILongPressGestureRecognizer) {
//        if sender.state == UIGestureRecognizerState.Began {
//            proxy.insertText("\(keymap[sender.view!.tag][1])")
//        }
    }

    func pressNumKey() {
//        if numeric {
//            keyboard.numeric.setTitle("123", forState: .Normal)
//            for special in keyboard.specials{
//                if special.tag <= 9{
//                    special.setTitle("\(keymap[special.tag][0])", forState: .Normal)
//                }
//            }
//            numeric = false
//        }else{
//            keyboard.numeric.setTitle("{[(", forState: .Normal)
//            for special in keyboard.specials{
//                if special.tag <= 9{
//                    special.setTitle("\(special.tag)", forState: .Normal)
//                }
//            }
//            numeric = true
//        }
    }

    func pressReturnKey() {
        proxy.insertText("\n")
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    
//    override func textWillChange(textInput: UITextInput) {
//        // The app is about to change the document's contents. Perform any preparation here.
//    }
//    
//    override func textDidChange(textInput: UITextInput) {
//        var textColor: UIColor
//        var proxy = self.textDocumentProxy as! UITextDocumentProxy
//        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
//            textColor = UIColor.whiteColor()
//        } else {
//            textColor = UIColor.blackColor()
//        }
//        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
//    }
}
