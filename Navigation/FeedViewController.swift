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
        
        // Устанавливаем мятный цвет фона
        view.backgroundColor = UIColor.systemMint
        
        title = "Feed"

        // Создаем кнопку для перехода на PostViewController
        let postButton = UIButton(type: .system)
        postButton.setTitle("Open Post", for: .normal)
        postButton.setTitleColor(.white, for: .normal)
        postButton.backgroundColor = .systemBlue
        postButton.layer.cornerRadius = 10
        postButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        postButton.addTarget(self, action: #selector(openPost), for: .touchUpInside)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postButton)
        
        // Устанавливаем ограничения для кнопки
        NSLayoutConstraint.activate([
            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            postButton.widthAnchor.constraint(equalToConstant: 150),
            postButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func openPost() {
        let post = Post(title: "Sample Post")
        let postVC = PostViewController()
        postVC.post = post
        navigationController?.pushViewController(postVC, animated: true)
    }
}
