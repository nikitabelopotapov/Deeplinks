//
//  RoutingErrorHandler.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import UIKit

protocol RoutingErrorHandlerProtocol {
	func handleUnavailableTransition()
	func handleUnsupportedTransition()
}

final class RoutingErrorHandler: RoutingErrorHandlerProtocol {
	func handleUnsupportedTransition() {
		let alert = UIAlertController(title: "Unsupported transition", message: "This transition is unsupported", preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
		alert.addAction(cancelAction)
		UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
	}

	func handleUnavailableTransition() {
		let alert = UIAlertController(title: "Unavailable transition", message: "This transition is unavailable", preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
		alert.addAction(cancelAction)
		UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
	}
}
