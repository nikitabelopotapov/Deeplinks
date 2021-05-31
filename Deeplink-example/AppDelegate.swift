//
//  AppDelegate.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	private lazy var tabbarController = UITabBarController()
	private lazy var router = Router()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		// First module configuration
		let navigationController1 = UINavigationController()
		let viewController1 = Module1ViewController()
		navigationController1.setViewControllers([viewController1], animated: false)
		viewController1.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)

		// Second module configuration
		let navigationController2 = UINavigationController()
		let viewController2 = Module2ViewController()
		navigationController2.setViewControllers([viewController2], animated: false)
		viewController2.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)

		// Tabbar configuration
		tabbarController.setViewControllers([navigationController1, navigationController2], animated: true)


		// Window configuration
		window = UIWindow()
		window?.rootViewController = tabbarController
		window?.makeKeyAndVisible()


		// Initializing error handler - error handler abstraction for router
		let errorHandler = RoutingErrorHandler()
		router.set(errorHandler: errorHandler)

		// Adding modules as routing assemblies for router
		if let module1 = Module1.module as? RoutingAssembly {
			router.append(assembly: module1)
		}

		if let module2 = Module2.module as? RoutingAssembly {
			router.append(assembly: module2)
		}
		return true
	}

	func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
		/*
			Parsing received URL to get transition key
			for example we receive URL deeplink-example://transition1?param1=qwe&param2=rty
			to start transition, all we need is transition1 string
			so we truncate url scheme by separating string by "://"
			and then truncate right part of link by separating string by ? sign
		*/
		if let endpointPath = url.absoluteString.components(separatedBy: "://").last?.components(separatedBy: "?").first {
			if let navigation = tabbarController.selectedViewController as? UINavigationController {
				router.set(navigation: navigation)
				router.startTransition(key: endpointPath, options: options)
				return true
			}
		}

		return false
	}


}
