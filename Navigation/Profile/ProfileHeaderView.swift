import UIKit

class ProfileHeaderView: UIView {
    
    // Строка для хранения статуса, введённого пользователем
    private var statusText: String = ""

    // Аватар пользователя
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = ProfileHeaderConstants.avatarSize / 2 // Закругляем до круга
        imageView.clipsToBounds = true // Обрезаем по границам
        imageView.contentMode = .scaleAspectFill // Заполняем изображением, сохраняя пропорции
        imageView.layer.borderWidth = 3 // Белая рамка вокруг аватара
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image = UIImage(named: "Alba") // Тестовое изображение
        return imageView
    }()

    // Полное имя пользователя
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold) // Полужирный текст
        label.textColor = .black // Чёрный цвет
        label.text = "Alba" // Имя пользователя
        label.numberOfLines = 1 // Одна строка текста
        return label
    }()

    // Лейбл для отображения текущего статуса
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular) // Обычный текст
        label.textColor = .gray // Серый цвет текста
        label.text = "Waiting for something..." // Начальный текст статуса
        label.numberOfLines = 1 // Одна строка
        return label
    }()

    // Текстовое поле для ввода нового статуса
    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none // Без рамки
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular) // Обычный шрифт
        textField.textColor = .black // Чёрный текст
        textField.backgroundColor = .white // Белый фон
        textField.layer.cornerRadius = ProfileHeaderConstants.cornerRadius
        textField.layer.borderWidth = 1 // Чёрная рамка
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Enter your status..." // Подсказка внутри поля
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 40)) // Отступы слева
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()

    // Кнопка для сохранения статуса
    private let setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Set status", for: .normal) // Текст на кнопке
        button.setTitleColor(.white, for: .normal) // Белый текст
        button.backgroundColor = .systemBlue // Синий фон
        button.layer.cornerRadius = ProfileHeaderConstants.cornerRadius
        button.layer.shadowColor = UIColor.black.cgColor // Чёрная тень
        button.layer.shadowOffset = ProfileHeaderConstants.buttonShadowOffset
        button.layer.shadowOpacity = ProfileHeaderConstants.shadowOpacity
        button.layer.shadowRadius = ProfileHeaderConstants.shadowRadius
        return button
    }()

    // Обработчик нажатия кнопки "Set status"
    @objc private func buttonPressed() {
        statusLabel.text = statusText // Устанавливаем новый статус в лейбл
        print("Current status: \(statusText)") // Печатаем статус в консоль
    }

    // Обработчик изменения текста в текстовом поле
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "" // Сохраняем текст из текстового поля
    }

    // Конструктор, вызывается при создании в коде
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white // Белый фон заголовка
        addSubviews() // Добавляем все элементы на экран
        setupTargets() // Настраиваем обработчики
        setupConstraints() // Устанавливаем Auto Layout
    }

    // Конструктор для инициализации из Interface Builder
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented") // Не используется
    }

    // Метод для добавления всех subview
    private func addSubviews() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
    }

    // Настраиваем обработчики для кнопки и текстового поля
    private func setupTargets() {
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside) // Нажатие кнопки
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged) // Изменение текста
    }

    // Устанавливаем Auto Layout
    private func setupConstraints() {
        // Отключаем автоматические ограничения
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false

        // Устанавливаем ограничения
        NSLayoutConstraint.activate([
            // Аватар
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ProfileHeaderConstants.padding),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: ProfileHeaderConstants.padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: ProfileHeaderConstants.avatarSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: ProfileHeaderConstants.avatarSize),

            // Полное имя
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: ProfileHeaderConstants.labelToAvatarOffset),
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: ProfileHeaderConstants.labelToAvatarOffset),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ProfileHeaderConstants.padding),

            // Лейбл статуса
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: ProfileHeaderConstants.labelToAvatarOffset),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: ProfileHeaderConstants.spacingBetweenLabels),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ProfileHeaderConstants.padding),

            // Текстовое поле
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: ProfileHeaderConstants.spacingBetweenLabels),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ProfileHeaderConstants.padding),
            statusTextField.heightAnchor.constraint(equalToConstant: ProfileHeaderConstants.textFieldHeight),

            // Кнопка
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ProfileHeaderConstants.padding),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: ProfileHeaderConstants.padding),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ProfileHeaderConstants.padding),
            setStatusButton.heightAnchor.constraint(equalToConstant: ProfileHeaderConstants.buttonHeight)
        ])
    }
}
