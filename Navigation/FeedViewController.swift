//
//  FeedViewController.swift
//  Navigation
//
//  Created by Николай Иванов on 26.10.2024.
//

import UIKit

class FeedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Устанавливаем фон
        view.backgroundColor = UIColor.systemMint
        title = "Feed"

        // Создаем кнопки
        let button1 = createStyledButton(title: "Open Post 1")
        button1.addTarget(self, action: #selector(openPost), for: .touchUpInside)

        let button2 = createStyledButton(title: "Open Post 2")
        button2.addTarget(self, action: #selector(openPost), for: .touchUpInside)

        // Создаем UIStackView
        let stackView = UIStackView(arrangedSubviews: [button1, button2])
        stackView.axis = .vertical
        stackView.spacing = 10 // Отступ между кнопками
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        // Устанавливаем ограничения для stackView
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    // Метод для стилизации кнопок
    private func createStyledButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue

        // Стилизация кнопки, как в исходном коде
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false

        // Устанавливаем фиксированные размеры, как в исходном коде
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])

        return button
    }

    // Открытие PostViewController
    @objc func openPost() {
        let post = Post(title: "Sample Post")
        let postVC = PostViewController()
        postVC.post = post
        navigationController?.pushViewController(postVC, animated: true)
    }
}
