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
        view.backgroundColor = .white
        title = post?.title

        // Добавляем Bar Button Item
        let infoButton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(showInfo))
        navigationItem.rightBarButtonItem = infoButton
    }
    
    @objc func showInfo() {
        let infoVC = InfoViewController()
        infoVC.modalPresentationStyle = .fullScreen
        present(infoVC, animated: true, completion: nil)
    }
}

