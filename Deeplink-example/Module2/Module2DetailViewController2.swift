//
//  Module2DetailViewController2.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import UIKit

final class Module2DetailViewController2: UIViewController {
	private let textLabel = UILabel()
	override func viewDidLoad() {
		super.viewDidLoad()
		textLabel.translatesAutoresizingMaskIntoConstraints = false
		textLabel.text = "\(Module2DetailViewController2.self)"

		view.addSubview(textLabel)
		NSLayoutConstraint.activate([
			textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])
		view.backgroundColor = .white
	}
}
