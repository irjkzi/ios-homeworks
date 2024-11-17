//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Николай Иванов on 17.11.2024.
//

import UIKit

class ProfileHeaderView: UIView {
    
    // Создаем аватар
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image = UIImage(named: "Alba") // Изображение
        return imageView
    }()
    
    // Создаем метку для имени
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Alba" // Имя
        label.numberOfLines = 1
        return label
    }()
    
    // Создаем метку для статуса
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = "Waiting for something..." // Текст статуса
        label.numberOfLines = 1
        return label
    }()
    
    // Создаем текстовое поле
    let statusTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none // Убираем стандартный стиль рамки
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .white // Белый фон
        textField.layer.cornerRadius = 12 // Закругляем углы
        textField.layer.borderWidth = 1 // Толщина рамки
        textField.layer.borderColor = UIColor.black.cgColor // Цвет рамки
        textField.clipsToBounds = true // Обрезаем содержимое, выходящее за границы
        textField.placeholder = "Enter your status..."

        // Добавляем отступ для текста
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 40)) // 12 pt отступ
        textField.leftView = paddingView
        textField.leftViewMode = .always

        return textField
    }()


    
    // Создаем кнопку
    let statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        return button
    }()
    
    // Обработчик для кнопки
    @objc private func buttonPressed() {
        // Устанавливаем текст из textField в statusLabel
        statusLabel.text = statusTextField.text
    }
    
    // Настраиваем представления
    private func setupViews() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(statusButton)
        
        // Добавляем обработчик нажатия для кнопки
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    // Конструктор
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Устанавливаем фреймы элементов
    override func layoutSubviews() {
        super.layoutSubviews()

        let safeAreaTop = safeAreaInsets.top // Учитываем отступ сверху
        let padding: CGFloat = 16
        let leftIndent: CGFloat = avatarImageView.frame.maxX + 27 // Левый отступ для всех элементов справа от аватара

        // Фрейм для аватара
        avatarImageView.frame = CGRect(
            x: padding,
            y: safeAreaTop + padding,
            width: 100,
            height: 100
        )

        // Фрейм для имени
        fullNameLabel.frame = CGRect(
            x: leftIndent,
            y: avatarImageView.frame.minY,
            width: bounds.width - leftIndent - padding,
            height: 22
        )

        // Фрейм для статуса
        statusLabel.frame = CGRect(
            x: leftIndent,
            y: fullNameLabel.frame.maxY + 27, // Отступ от имени — 27 pt
            width: bounds.width - leftIndent - padding,
            height: 20
        )

        // Фрейм для текстового поля
        statusTextField.frame = CGRect(
            x: leftIndent,
            y: statusLabel.frame.maxY + 8, // Отступ от статуса — 8 pt
            width: bounds.width - leftIndent - padding,
            height: 40 // Высота текстового поля
        )

        // Фрейм для кнопки
        statusButton.frame = CGRect(
            x: padding,
            y: statusTextField.frame.maxY + 34, // Отступ от текстового поля — 34 pt
            width: bounds.width - 2 * padding,
            height: 50
        )
    }

}
