//
//  ContactsViewController.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import UIKit

final class ContactsViewController: UIViewController {
	let contactDetailButton = UIButton()
	let emptyTransitionButton = UIButton()
	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .white

		view.addSubview(contactDetailButton)
		contactDetailButton.setTitleColor(.black, for: .normal)
		contactDetailButton.setTitle("Contact Details", for: .normal)
		contactDetailButton.translatesAutoresizingMaskIntoConstraints = false
		contactDetailButton.addTarget(self, action: #selector(contactDetail), for: .touchUpInside)

		view.addSubview(emptyTransitionButton)
		emptyTransitionButton.setTitleColor(.black, for: .normal)
		emptyTransitionButton.setTitle("Empty transition", for: .normal)
		emptyTransitionButton.translatesAutoresizingMaskIntoConstraints = false
		emptyTransitionButton.addTarget(self, action: #selector(emptyTransition), for: .touchUpInside)


		NSLayoutConstraint.activate([
			contactDetailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
			contactDetailButton.trailingAnchor.constraint(equalTo: emptyTransitionButton.leadingAnchor, constant: -20.0),
			contactDetailButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			contactDetailButton.widthAnchor.constraint(equalTo: emptyTransitionButton.widthAnchor),
			emptyTransitionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
			emptyTransitionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])
	}


	@objc func contactDetail() {
		guard let url = URL(string: Router.urlScheme + ContactsModuleTransitionKey.contactsDetail.rawValue) else { return }
		UIApplication.shared.open(url, options: [:], completionHandler: nil)
	}

	@objc func emptyTransition() {
		guard let url = URL(string: Router.urlScheme + "qwerty") else { return }
		UIApplication.shared.open(url, options: [:], completionHandler: nil)
	}
}
