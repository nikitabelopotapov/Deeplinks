//
//  RoutingAssembly.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import Foundation

/// Assembly for preparing transition for one specific module
protocol RoutingAssembly {

	/// Method finds endpoint for transition path passed into method
	/// - Parameter key: transition path
	func endpoint(for key: String) -> RoutingEndpoint.Type?
}
