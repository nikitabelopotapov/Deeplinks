//
//  ContactsEndpoint.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import UIKit

final class ContactsEndpoint: RoutingEndpoint {
	var isAvailable: Bool {
		return ContactsModule.module.isTransitionAvailable(for: ContactsModuleTransitionKey.contactsDetail.rawValue)
	}

	func startTransition(in navigation: UINavigationController?) {
		let viewController = ContactsDetailViewController()
		navigation?.pushViewController(viewController, animated: true)
	}
}
