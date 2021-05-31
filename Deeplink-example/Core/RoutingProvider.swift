//
//  RoutingProvider.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import Foundation
import UIKit

/// Protocol with main logic for router
protocol RoutingProvider {

	/// Appends new assembly for transition, in our case module is assembly, but it can be any other object conforming to RoutingAssembly protocol
	/// - Parameter assembly: new assembly
	func append(assembly: RoutingAssembly)

	/// Start transition with specified parameters
	/// - Parameters:
	///   - key: transition key, for example transition1
	///   - options: options received within method openURL in AppDelegate
	func startTransition(key: String, options: [UIApplication.OpenURLOptionsKey : Any])

	/// If you want your code be clean, you can pass navigation controller to router so endpoints could use it
	/// - Parameter navigation: navigation controller that should open new screen
	func set(navigation: UINavigationController)

	/// Error handler to show error during transition, cleans up router from error handling
	func set(errorHandler: RoutingErrorHandlerProtocol)
}


final class Router {
	static let urlScheme = "deeplink-example://"
	private var assemblies = [RoutingAssembly]()
	private weak var navigationController: UINavigationController?
	private var errorHandler: RoutingErrorHandlerProtocol?
}

extension Router: RoutingProvider {
	func append(assembly: RoutingAssembly) {
		assemblies.append(assembly)
	}

	func startTransition(key: String, options: [UIApplication.OpenURLOptionsKey : Any]) {

		/// Pass througth all assemblies to find needed endpoint to perform transition
		for assembly in assemblies {
			guard let endpointType = assembly.endpoint(for: key) else { continue }
			let endpoint = endpointType.init()
			
			if endpoint.isAvailable {
				endpoint.startTransition(in: navigationController)
			} else {
				errorHandler?.handleUnavailableTransition()
			}
			
			return
		}

		errorHandler?.handleUnsupportedTransition()
	}

	func set(navigation: UINavigationController) {
		navigationController = navigation
	}

	func set(errorHandler: RoutingErrorHandlerProtocol) {
		self.errorHandler = errorHandler
	}
}
