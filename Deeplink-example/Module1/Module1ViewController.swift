//
//  Module1ViewController.swift
//  Deeplink-example
//
//  Created by Nikita Belopotapov on 29.05.2021.
//

import UIKit

final class Module1ViewController: UIViewController {
	let transition1Button = UIButton()
	let transition2Button = UIButton()
	override func viewDidLoad() {
		super.viewDidLoad()

		view.addSubview(transition1Button)
		transition1Button.setTitle("Transition 1", for: .normal)
		transition1Button.translatesAutoresizingMaskIntoConstraints = false
		transition1Button.addTarget(self, action: #selector(transition1), for: .touchUpInside)

		view.addSubview(transition2Button)
		transition2Button.setTitle("Transition 2", for: .normal)
		transition2Button.translatesAutoresizingMaskIntoConstraints = false
		transition2Button.addTarget(self, action: #selector(transition2), for: .touchUpInside)


		NSLayoutConstraint.activate([
			transition1Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
			transition1Button.trailingAnchor.constraint(equalTo: transition2Button.leadingAnchor, constant: -20.0),
			transition1Button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			transition1Button.widthAnchor.constraint(equalTo: transition2Button.widthAnchor),
			transition2Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
			transition2Button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])

		view.backgroundColor = .green
	}


	@objc func transition1() {
		guard let url = URL(string: Router.urlScheme + Module1TransitionKey.transition1.rawValue) else { return }
		UIApplication.shared.open(url, options: [:], completionHandler: nil)
	}

	@objc func transition2() {
		guard let url = URL(string: Router.urlScheme + Module1TransitionKey.transition2.rawValue) else { return }
		UIApplication.shared.open(url, options: [:], completionHandler: nil)
	}
}
