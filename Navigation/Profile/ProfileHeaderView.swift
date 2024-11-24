//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Николай Иванов on 17.11.2024.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String = ""

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = ProfileHeaderConstants.avatarSize / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image = UIImage(named: "Alba")
        return imageView
    }()

    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Alba"
        label.numberOfLines = 1
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = "Waiting for something..."
        label.numberOfLines = 1
        return label
    }()

    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = ProfileHeaderConstants.cornerRadius
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Enter your status..."
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 40))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()

    private let setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = ProfileHeaderConstants.cornerRadius
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = ProfileHeaderConstants.buttonShadowOffset
        button.layer.shadowOpacity = ProfileHeaderConstants.shadowOpacity
        button.layer.shadowRadius = ProfileHeaderConstants.shadowRadius
        return button
    }()

    // Настраиваем обработчики
    @objc private func buttonPressed() {
        statusLabel.text = statusText
        print("Current status: \(statusText)")
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }

    // Конструктор
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupTargets()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Добавляем subviews
    private func addSubviews() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
    }

    // Добавляем обработчики
    private func setupTargets() {
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
    }

    // Настраиваем Auto Layout
    private func setupConstraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ProfileHeaderConstants.padding),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: ProfileHeaderConstants.padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: ProfileHeaderConstants.avatarSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: ProfileHeaderConstants.avatarSize),

            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: ProfileHeaderConstants.labelToAvatarOffset),
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: ProfileHeaderConstants.labelToAvatarOffset),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ProfileHeaderConstants.padding),

            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: ProfileHeaderConstants.labelToAvatarOffset),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: ProfileHeaderConstants.spacingBetweenLabels),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ProfileHeaderConstants.padding),

            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: ProfileHeaderConstants.spacingBetweenLabels),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ProfileHeaderConstants.padding),
            statusTextField.heightAnchor.constraint(equalToConstant: ProfileHeaderConstants.textFieldHeight),

            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ProfileHeaderConstants.padding),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: ProfileHeaderConstants.padding),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ProfileHeaderConstants.padding),
            setStatusButton.heightAnchor.constraint(equalToConstant: ProfileHeaderConstants.buttonHeight)
        ])
    }
}
