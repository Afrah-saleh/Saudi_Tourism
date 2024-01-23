//
//  MainViewController.swift
//  SlidingIntroScreen
//
//  Created by Muna Aiman Al-hajj on 11/07/1445 AH.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }

    private func setupButton() {
        let button = UIButton(type: .system)
        button.setTitle("Show Popup", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func buttonTapped() {
        let popupViewController = PopupViewController()
        popupViewController.modalPresentationStyle = .overCurrentContext
        popupViewController.modalTransitionStyle = .crossDissolve
        present(popupViewController, animated: true, completion: nil)
    }
}
