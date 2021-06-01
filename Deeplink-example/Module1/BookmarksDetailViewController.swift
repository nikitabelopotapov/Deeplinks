//
//  BookmarksDetailViewController.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import UIKit

final class BookmarksDetailViewController: UIViewController {
	private let textLabel = UILabel()
	override func viewDidLoad() {
		super.viewDidLoad()
		textLabel.translatesAutoresizingMaskIntoConstraints = false
		textLabel.text = "\(BookmarksDetailViewController.self)"

		view.addSubview(textLabel)
		NSLayoutConstraint.activate([
			textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])
		view.backgroundColor = .white
	}
}
