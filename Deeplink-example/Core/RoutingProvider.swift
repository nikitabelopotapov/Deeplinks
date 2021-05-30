//
//  RoutingProvider.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import Foundation
import UIKit

protocol RoutingProvider {
	func append(assembly: RoutingAssembly)
	func startTransition(key: String, options: [UIApplication.OpenURLOptionsKey : Any])
	func set(navigation: UINavigationController)
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
