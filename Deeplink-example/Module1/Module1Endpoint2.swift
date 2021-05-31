//
//  Module1Endpoint2.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import UIKit

final class Module1Endpoint2: RoutingEndpoint {
	var isAvailable: Bool {
		return Module1.module.isTransitionAvailable(for: Module1TransitionKey.transition2.rawValue)
	}

	func startTransition(in navigation: UINavigationController?) {
		let viewController = Module1DetailViewController2()
		navigation?.pushViewController(viewController, animated: true)
	}
}
