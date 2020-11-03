//
//  AppDelegate.swift
//  keyboard
//
//  Created by p4bloch on 7/25/15.
//  Copyright (c) 2015 j0rgitoPr0ductions. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let userHasOnboardedKey = "user_has_onboarded"

    private func application(application: UIApplication,
                             didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        self.window!.backgroundColor = UIColor(hue:0, saturation:0, brightness:0.04, alpha:1)
//        application.statusBarStyle = UIStatusBarStyle.LightContent
//        var userHasOnboardedAlready = NSUserDefaults.standardUserDefaults().boolForKey(userHasOnboardedKey);
//        if userHasOnboardedAlready {
//            self.setupNormalRootVC(false);
//        }
//        else {
//            self.window!.rootViewController = self.generateOnboardingViewController()
//        }
//        self.window!.makeKeyAndVisible()
        return true
    }

//    func generateOnboardingViewController() -> ViewController {
//
//        let firstPage: OnboardingContentViewController =
    //OnboardingContentViewController(title: "var KeyCo = \"A Custom Keyboard for developers\"",
//    /body: "", image: UIImage(named:
//            "icon"), index: 0) {
//                println("Do something here...");
//        }
//
//        let secondPage: OnboardingContentViewController =
    //OnboardingContentViewController(title: "Make a long tap for more special keys", body: "", image: UIImage(named:
//            "key"), index: 1) {
//                println("1");
//        }
//
//        let thirdPage: OnboardingContentViewController =
    //OnboardingContentViewController(title: "Install it \n \n Settings > General >
    //Keyboards > Add New Keyboards > KeyCo", body: "", image: UIImage(named:
//            "icon"), index: 2) {
//                println("2");
//        }
//
//       let onboardingVC: ViewController = ViewController(backgroundImage: UIImage(named: "Splash"),
    //       contents: [firstPage, secondPage, thirdPage])
//        return onboardingVC
//    }
//    
    func handleOnboardingCompletion() {
//        NSUserDefaults.standardUserDefaults().setBool(true, forKey: userHasOnboardedKey)
//        setupNormalRootVC(true)
    }

    func setupNormalRootVC(animated: Bool) {
        // Here I'm just creating a generic view controller to represent the root of my application.
//        var mainVC = UIViewController()
//        mainVC.title = "Main Application"
//
//        if animated {
//            UIView.transitionWithView(self.window!,
        //duration: 0.5, options:.TransitionCrossDissolve, animations: { () -> Void in
//                self.window!.rootViewController = mainVC
//                }, completion:nil)
//        }
//        else {
//            self.window?.rootViewController = mainVC;
//        }
    }
}
