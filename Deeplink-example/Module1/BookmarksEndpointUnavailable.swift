//
//  BookmarksEndpointUnavailable.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import UIKit

final class BookmarksEndpointUnavailable: RoutingEndpoint {
	var isAvailable: Bool {
		return BookmarksModule.module.isTransitionAvailable(for: BookmarksModuleTransitionKey.bookmarkDetail2.rawValue)
	}

	func startTransition(in navigation: UINavigationController?) {
		let viewController = BookmarksDetailViewController2()
		navigation?.pushViewController(viewController, animated: true)
	}
}
