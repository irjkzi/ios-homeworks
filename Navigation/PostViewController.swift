//
//  PostViewController.swift
//  Navigation
//
//  Created by Николай Иванов on 26.10.2024.
//

import UIKit

struct Post {
    let title: String
}

class PostViewController: UIViewController {
    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Устанавливаем мятный цвет фона
        view.backgroundColor = UIColor.systemMint
        title = post?.title

        // Добавляем Bar Button Item
        let infoButton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(showInfo))
        navigationItem.rightBarButtonItem = infoButton
    }
    
    @objc func showInfo() {
        let infoVC = InfoViewController()
        // Устанавливаем стиль модального представления на pageSheet
        infoVC.modalPresentationStyle = .pageSheet
        present(infoVC, animated: true, completion: nil)
    }
}
