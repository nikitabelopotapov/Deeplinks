//
//  Endpoint.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import UIKit

/// Protocol describes endpoint
protocol RoutingEndpoint: AnyObject {

	/// Check whether transition available with this endpoint
	var isAvailable: Bool { get }
	init()

	/// Starts transition in specified navigation controller
	func startTransition(in navigation: UINavigationController?)
}
