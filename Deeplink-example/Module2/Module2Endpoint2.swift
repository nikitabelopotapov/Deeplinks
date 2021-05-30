//
//  Module2Endpoint2.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import UIKit

final class Module2Endpoint2: RoutingEndpoint {
	var isAvailable: Bool {
		let module = Module2.module as? RoutingAssembly
		return module?.isTransitionAvailable(for: Module2TransitionKey.transition4.rawValue) ?? false
	}

	func startTransition(in navigation: UINavigationController?) {
		let viewController = Module2DetailViewController2()
		navigation?.pushViewController(viewController, animated: true)
	}
}