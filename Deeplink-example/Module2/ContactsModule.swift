//
//  ContactsModule.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import Foundation

enum ContactsModuleTransitionKey: String {
	case contactsDetail
}

final class ContactsModule {
	private static let privateModule = ContactsModule()
	let availabilityFacade = ContactsAvailabilityFacade()
}

extension ContactsModule: FeatureModule {
	static var module: FeatureModule {
		return ContactsModule.privateModule
	}
}

extension ContactsModule: RoutingAssembly {
	func isTransitionAvailable(for key: String) -> Bool {
		switch key {
		case ContactsModuleTransitionKey.contactsDetail.rawValue:
			return availabilityFacade.isContactsDetailTransitionAvailable
		default:
			return false
		}
	}
	
	func endpoint(for key: String) -> RoutingEndpoint.Type? {
		switch key {
		case ContactsModuleTransitionKey.contactsDetail.rawValue:
			return ContactsEndpoint.self
		default:
			return nil
		}
	}
}

/// Mock struct to show how endpoint availability could be used
struct ContactsAvailabilityFacade {
	let isContactsDetailTransitionAvailable = true
}

