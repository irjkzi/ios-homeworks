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
        
        // Устанавливаем мятный цвет фона экрана
        view.backgroundColor = UIColor.systemMint
        
        // Создаем кнопку для отображения UIAlertController
        let alertButton = UIButton(type: .system)
        
        // Настраиваем кнопку: текст, цвет, фон
        alertButton.setTitle("Show Alert", for: .normal)
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.backgroundColor = .systemBlue
        alertButton.layer.cornerRadius = 10 // Скругляем углы кнопки
        alertButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18) // Задаём шрифт
        
        // Добавляем действие при нажатии на кнопку
        alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        // Отключаем автоматические ограничения
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Добавляем кнопку на экран
        view.addSubview(alertButton)
        
        // Настраиваем Auto Layout для кнопки
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), // По центру по горизонтали
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor), // По центру по вертикали
            alertButton.widthAnchor.constraint(equalToConstant: 150),          // Ширина кнопки
            alertButton.heightAnchor.constraint(equalToConstant: 50)           // Высота кнопки
        ])
    }
    
    // Метод для отображения UIAlertController
    @objc func showAlert() {
        // Создаём UIAlertController с заголовком и текстом сообщения
        let alert = UIAlertController(title: "Alert", message: "This is a sample alert", preferredStyle: .alert)
        
        // Добавляем действие "OK"
        let action1 = UIAlertAction(title: "OK", style: .default) { _ in
            // Действие при нажатии на "OK"
            print("OK tapped")
        }
        
        // Добавляем действие "Cancel"
        let action2 = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            // Действие при нажатии на "Cancel"
            print("Cancel tapped")
        }
        
        // Добавляем действия в UIAlertController
        alert.addAction(action1)
        alert.addAction(action2)
        
        // Показываем UIAlertController на экране
        present(alert, animated: true, completion: nil)
    }
}
