//
//  PostViewController.swift
//  Navigation
//
//  Created by Николай Иванов on 26.10.2024.
//

import UIKit

// Модель для представления простого поста
struct SimplePost {
    let title: String // Заголовок поста
}

// Контроллер для отображения поста
class PostViewController: UIViewController {
    
    // Переменная для хранения текущего поста
    var post: SimplePost?

    // MARK: - Жизненный цикл ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Устанавливаем цвет фона
        view.backgroundColor = UIColor.systemMint
        
        // Устанавливаем заголовок экрана (если он есть в модели)
        title = post?.title
        
        // Создаём кнопку "Info" в правой части навигационной панели
        let infoButton = UIBarButtonItem(
            title: "Info",
            style: .plain,
            target: self,
            action: #selector(showInfo) // Метод, вызываемый при нажатии
        )
        navigationItem.rightBarButtonItem = infoButton
    }
    
    // MARK: - Действия
    
    // Метод для отображения экрана "Info"
    @objc func showInfo() {
        // Создаём экземпляр InfoViewController
        let infoVC = InfoViewController()
        
        // Устанавливаем стиль модального представления на "pageSheet"
        infoVC.modalPresentationStyle = .pageSheet
        
        // Переход на экран Info
        present(infoVC, animated: true, completion: nil)
    }
}
