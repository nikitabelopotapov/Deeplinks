//
//  RoutingAssembly.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import Foundation

protocol RoutingAssembly {
	func isTransitionAvailable(for key: String) -> Bool
	func endpoint(for key: String) -> RoutingEndpoint.Type?
}
