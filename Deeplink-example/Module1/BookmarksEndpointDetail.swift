//
//  BookmarksEndpointDetail.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import UIKit

final class BookmarksEndpointDetail: RoutingEndpoint {
	var isAvailable: Bool {
		return BookmarksModule.module.isTransitionAvailable(for: BookmarksModuleTransitionKey.bookmarkDetail.rawValue)
	}

	func startTransition(in navigation: UINavigationController?) {
		let viewController = BookmarksDetailViewController()
		navigation?.pushViewController(viewController, animated: true)
	}
}
