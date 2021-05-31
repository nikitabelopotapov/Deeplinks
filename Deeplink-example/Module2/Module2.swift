//
//  Module2.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import Foundation

enum Module2TransitionKey: String {
	case transition3
	case transition4
}

final class Module2 {
	private static let privateModule = Module2()
	let availabilityFacade = YourAvailabilityFacade2()
}

extension Module2: FeatureModule {
	static var module: FeatureModule {
		return Module2.privateModule
	}
}

extension Module2: RoutingAssembly {
	func isTransitionAvailable(for key: String) -> Bool {
		switch key {
		case Module2TransitionKey.transition3.rawValue:
			return availabilityFacade.isTransition3Available
		case Module2TransitionKey.transition4.rawValue:
			return availabilityFacade.isTransition4Available
		default:
			return false
		}
	}
	
	func endpoint(for key: String) -> RoutingEndpoint.Type? {
		switch key {
		case Module2TransitionKey.transition3.rawValue:
			return Module2Endpoint1.self
		case Module2TransitionKey.transition4.rawValue:
			return Module2Endpoint2.self
		default:
			return nil
		}
	}
}

/// Mock struct to show how endpoint availability could be used
struct YourAvailabilityFacade2 {
	let isTransition3Available = true
	let isTransition4Available = true
}

