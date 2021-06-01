//
//  BookmarksModule.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import Foundation

enum BookmarksModuleTransitionKey: String {
	case bookmarkDetail
	case bookmarkDetail2
}


final class BookmarksModule {
	private static let privateModule = BookmarksModule()
	let availabilityFacade = BookmarksAvailabilityFacade()
}

extension BookmarksModule: FeatureModule {
	static var module: FeatureModule {
		return BookmarksModule.privateModule
	}
}

extension BookmarksModule: RoutingAssembly {
	func endpoint(for key: String) -> RoutingEndpoint.Type? {
		switch key {
		case BookmarksModuleTransitionKey.bookmarkDetail.rawValue:
			return BookmarksEndpointDetail.self
		case BookmarksModuleTransitionKey.bookmarkDetail2.rawValue:
			return BookmarksEndpointUnavailable.self
		default:
			return nil
		}
	}

	func isTransitionAvailable(for key: String) -> Bool {
		switch key {
		case BookmarksModuleTransitionKey.bookmarkDetail.rawValue:
			return availabilityFacade.isBookmarkDetailTransitionAvailable
		case BookmarksModuleTransitionKey.bookmarkDetail2.rawValue:
			return availabilityFacade.isBookmarkDetailTransition2Available
		default:
			return false
		}
	}
}


/// Mock struct to show how endpoint availability could be used
struct BookmarksAvailabilityFacade {
	let isBookmarkDetailTransitionAvailable = true
	let isBookmarkDetailTransition2Available = false
}

