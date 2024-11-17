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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // Создаем метку для имени
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Alba" // Имя
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Создаем метку для статуса
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = "Waiting for something..." // Текст статуса
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Создаем кнопку
    let statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // Обработчик для кнопки
    @objc private func buttonPressed() {
        print(statusLabel.text ?? "Нет статуса")
    }

    // Настраиваем представления
    private func setupViews() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
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

        // Фрейм для аватара
        avatarImageView.frame = CGRect(
            x: padding,
            y: safeAreaTop + padding,
            width: 100,
            height: 100
        )

        // Фрейм для имени
        fullNameLabel.frame = CGRect(
            x: avatarImageView.frame.maxX + padding,
            y: avatarImageView.frame.minY,
            width: bounds.width - avatarImageView.frame.maxX - 2 * padding,
            height: 22
        )

        // Фрейм для статуса
        statusLabel.frame = CGRect(
            x: avatarImageView.frame.maxX + padding,
            y: fullNameLabel.frame.maxY + 8,
            width: bounds.width - avatarImageView.frame.maxX - 2 * padding,
            height: 20
        )

        // Фрейм для кнопки
        statusButton.frame = CGRect(
            x: padding,
            y: avatarImageView.frame.maxY + 34,
            width: bounds.width - 2 * padding,
            height: 50
        )
    }
}
