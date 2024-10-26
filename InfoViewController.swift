//
//  InfoViewController.swift
//  Navigation
//
//  Created by Николай Иванов on 26.10.2024.
//

import UIKit

class InfoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6

        // Создаем кнопку для показа UIAlertController
        let alertButton = UIButton(type: .system)
        alertButton.setTitle("Show Alert", for: .normal)
        alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alertButton)

        // Устанавливаем ограничения для кнопки
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func showAlert() {
        let alert = UIAlertController(title: "Alert", message: "This is a sample alert", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "OK", style: .default) { _ in
            print("OK tapped")
        }
        let action2 = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel tapped")
        }
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
    }
}
