//
//  ContactsDetailViewController.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import UIKit

final class ContactsDetailViewController: UIViewController {
	private let textLabel = UILabel()
	override func viewDidLoad() {
		super.viewDidLoad()
		textLabel.translatesAutoresizingMaskIntoConstraints = false
		textLabel.text = "\(ContactsDetailViewController.self)"

		view.addSubview(textLabel)
		NSLayoutConstraint.activate([
			textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])
		view.backgroundColor = .white
	}
}
