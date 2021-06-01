//
//  BookmarksViewController.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import UIKit

final class BookmarksViewController: UIViewController {
	let bookmarkDetailButton = UIButton()
	let unavailableTransitionButton = UIButton()
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		view.addSubview(bookmarkDetailButton)
		bookmarkDetailButton.setTitleColor(.black, for: .normal)
		bookmarkDetailButton.setTitle("Detail", for: .normal)
		bookmarkDetailButton.translatesAutoresizingMaskIntoConstraints = false
		bookmarkDetailButton.addTarget(self, action: #selector(bookmarkDetail), for: .touchUpInside)

		view.addSubview(unavailableTransitionButton)
		unavailableTransitionButton.setTitleColor(.black, for: .normal)
		unavailableTransitionButton.setTitle("Unavailable", for: .normal)
		unavailableTransitionButton.translatesAutoresizingMaskIntoConstraints = false
		unavailableTransitionButton.addTarget(self, action: #selector(unavailableTransition), for: .touchUpInside)


		NSLayoutConstraint.activate([
			bookmarkDetailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
			bookmarkDetailButton.trailingAnchor.constraint(equalTo: unavailableTransitionButton.leadingAnchor, constant: -20.0),
			bookmarkDetailButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			bookmarkDetailButton.widthAnchor.constraint(equalTo: unavailableTransitionButton.widthAnchor),
			unavailableTransitionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
			unavailableTransitionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])
	}


	@objc func bookmarkDetail() {
		guard let url = URL(string: Router.urlScheme + BookmarksModuleTransitionKey.bookmarkDetail.rawValue) else { return }
		UIApplication.shared.open(url, options: [:], completionHandler: nil)
	}

	@objc func unavailableTransition() {
		guard let url = URL(string: Router.urlScheme + BookmarksModuleTransitionKey.bookmarkDetail2.rawValue) else { return }
		UIApplication.shared.open(url, options: [:], completionHandler: nil)
	}
}
