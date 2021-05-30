//
//  Module2ViewController.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import UIKit

final class Module2ViewController: UIViewController {
	let transition3Button = UIButton()
	let transition4Button = UIButton()
	override func viewDidLoad() {
		super.viewDidLoad()

		view.addSubview(transition3Button)
		transition3Button.setTitle("Transition 3", for: .normal)
		transition3Button.translatesAutoresizingMaskIntoConstraints = false
		transition3Button.addTarget(self, action: #selector(transition3), for: .touchUpInside)

		view.addSubview(transition4Button)
		transition4Button.setTitle("Transition 4", for: .normal)
		transition4Button.translatesAutoresizingMaskIntoConstraints = false
		transition4Button.addTarget(self, action: #selector(transition4), for: .touchUpInside)


		NSLayoutConstraint.activate([
			transition3Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
			transition3Button.trailingAnchor.constraint(equalTo: transition4Button.leadingAnchor, constant: -20.0),
			transition3Button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			transition3Button.widthAnchor.constraint(equalTo: transition4Button.widthAnchor),
			transition4Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
			transition4Button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])

		view.backgroundColor = .green
	}


	@objc func transition3() {
		guard let url = URL(string: Router.urlScheme + Module2TransitionKey.transition3.rawValue) else { return }
		UIApplication.shared.open(url, options: [:], completionHandler: nil)
	}

	@objc func transition4() {
		guard let url = URL(string: Router.urlScheme + "qwerty") else { return }
		UIApplication.shared.open(url, options: [:], completionHandler: nil)
	}
}
