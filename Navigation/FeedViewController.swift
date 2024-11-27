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
        
        // Устанавливаем цвет фона экрана
        view.backgroundColor = UIColor.systemMint
        
        // Устанавливаем заголовок в навигационной панели
        title = "Feed"
        
        // Создаём две кнопки
        let button1 = createStyledButton(title: "Open Post 1")
        button1.addTarget(self, action: #selector(openPost), for: .touchUpInside) // Добавляем действие для кнопки
        
        let button2 = createStyledButton(title: "Open Post 2")
        button2.addTarget(self, action: #selector(openPost), for: .touchUpInside) // Добавляем действие для кнопки
        
        // Создаём вертикальный стек для размещения кнопок
        let stackView = UIStackView(arrangedSubviews: [button1, button2])
        stackView.axis = .vertical // Кнопки располагаются вертикально
        stackView.spacing = 10 // Устанавливаем расстояние между кнопками
        stackView.alignment = .center // Выравнивание кнопок по центру
        stackView.translatesAutoresizingMaskIntoConstraints = false // Отключаем автоматические ограничения
        
        // Добавляем стек на главный вид
        view.addSubview(stackView)
        
        // Устанавливаем ограничения для стека
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor), // По горизонтали по центру
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)  // По вертикали по центру
        ])
    }
    
    // Метод для создания кнопки с заданным стилем
    private func createStyledButton(title: String) -> UIButton {
        // Создаём кнопку
        let button = UIButton(type: .system)
        
        // Устанавливаем текст и цвет текста кнопки
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        // Устанавливаем цвет фона и скругление углов
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        
        // Настраиваем шрифт текста кнопки
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        // Отключаем автоматические ограничения
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Добавляем фиксированные размеры кнопки
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 150), // Ширина кнопки
            button.heightAnchor.constraint(equalToConstant: 50)  // Высота кнопки
        ])
        
        return button
    }
    
    // Метод для перехода на экран поста
    @objc func openPost() {
        // Создаём пример поста
        let post = SimplePost(title: "Sample Post")
        
        // Инициализируем контроллер для отображения поста
        let postVC = PostViewController()
        postVC.post = post
        
        // Переходим на новый экран
        navigationController?.pushViewController(postVC, animated: true)
    }
}
