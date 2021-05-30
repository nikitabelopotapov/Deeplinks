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
	private weak var tabbarController: UITabBarController?
	private let router = Router()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		let errorHandler = RoutingErrorHandler()
		router.set(errorHandler: errorHandler)
		window = UIWindow()
		let tabbarController = UITabBarController()
		let navigationController1 = UINavigationController()
		let viewController1 = Module1ViewController()
		navigationController1.setViewControllers([viewController1], animated: false)
		viewController1.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)

		let navigationController2 = UINavigationController()
		let viewController2 = Module2ViewController()
		navigationController2.setViewControllers([viewController2], animated: false)
		viewController2.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)

		tabbarController.setViewControllers([navigationController1, navigationController2], animated: true)
		self.tabbarController = tabbarController

		window?.rootViewController = tabbarController
		window?.makeKeyAndVisible()
		
		if let module1 = Module1.module as? RoutingAssembly {
			router.append(assembly: module1)
		}

		if let module2 = Module2.module as? RoutingAssembly {
			router.append(assembly: module2)
		}
		return true
	}

	func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
		if let endpointPath = url.absoluteString.components(separatedBy: "://").last?.components(separatedBy: "?").first {
			if let navigation = tabbarController?.selectedViewController as? UINavigationController {
				router.set(navigation: navigation)
				router.startTransition(key: endpointPath, options: options)
				return true
			}
		}

		return false
	}


}
