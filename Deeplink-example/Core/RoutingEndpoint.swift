//
//  Endpoint.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import UIKit

protocol RoutingEndpoint: AnyObject {
	var isAvailable: Bool { get }
	init()
	func startTransition(in navigation: UINavigationController?)
}
