//
//  AppDelegate.swift
//  TabColorSwitch
//
//  Created by Aleksandar Vacić on 26.3.17..
//  Copyright © 2017. Radiant Tap. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .normal)

		if let tbc = window?.rootViewController as? UITabBarController {
			tbc.delegate = self
			if let vc = tbc.viewControllers?.first {
				adjustBackground(tabBarController: tbc, for: vc)
			}
		}

		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}
}


extension AppDelegate: UITabBarControllerDelegate {
	func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
		adjustBackground(tabBarController: tabBarController, for: viewController)
	}

	fileprivate func adjustBackground(tabBarController: UITabBarController, for viewController: UIViewController) {
		guard let color = tabBackgroundColor(for: viewController) else { return }
		var size = tabBarController.tabBar.bounds.size
		size.width = 1

		let img = UIImage.imageWithColor(color, size: size)?.resizableImage(withCapInsets: .zero)

		tabBarController.tabBar.selectionIndicatorImage = img
	}

	fileprivate func tabBackgroundColor(for viewController: UIViewController) -> UIColor? {
		switch viewController {
		case is FirstViewController:
			return .red
		case is SecondViewController:
			return .green
		default:
			return nil
		}
	}
}
