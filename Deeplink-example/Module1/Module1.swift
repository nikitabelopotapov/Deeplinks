//
//  Module1.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import Foundation

enum Module1TransitionKey: String {
	case transition1
	case transition2
}


final class Module1 {
	private static let privateModule = Module1()
	let availabilityFacade = YourAvailabilityFacade1()
}

extension Module1: FeatureModule {
	static var module: FeatureModule {
		return Module1.privateModule
	}
}

extension Module1: RoutingAssembly {
	func endpoint(for key: String) -> RoutingEndpoint.Type? {
		switch key {
		case Module1TransitionKey.transition1.rawValue:
			return Module1Endpoint1.self
		case Module1TransitionKey.transition2.rawValue:
			return Module1Endpoint2.self
		default:
			return nil
		}
	}

	func isTransitionAvailable(for key: String) -> Bool {
		switch key {
		case Module1TransitionKey.transition1.rawValue:
			return availabilityFacade.isTransition1Available
		case Module1TransitionKey.transition2.rawValue:
			return availabilityFacade.isTransition2Available
		default:
			return false
		}
	}
}


/// Mock struct to show how endpoint availability could be used
struct YourAvailabilityFacade1 {
	let isTransition1Available = true
	let isTransition2Available = false
}

