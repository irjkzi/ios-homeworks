import UIKit

class LogInViewController: UIViewController {

    // Создаём ScrollView, чтобы можно было скроллить контент, если клавиатура перекрывает поля ввода
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    // Логотип
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "VKLogo") // Логотип приложения
        imageView.contentMode = .scaleAspectFit // Устанавливаем режим содержимого
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()

    // Поле ввода email или телефона
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or phone" // Подсказка
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray6
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none // Отключаем автокапитализацию
        return textField
    }()

    // Поле ввода пароля
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password" // Подсказка
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray6
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.isSecureTextEntry = true // Делаем текст скрытым
        return textField
    }()

    // Кнопка логина
    private let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal) // Белый текст
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal) // Задаём фон кнопки
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Настройка интерфейса
        setupUI()

        // Добавляем наблюдатели для клавиатуры
        setupKeyboardObservers()

        // Настройка действий
        setupActions()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Скрываем навигационную панель
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    // Настройка интерфейса
    private func setupUI() {
        view.backgroundColor = .white // Устанавливаем белый фон
        
        // Добавляем ScrollView и ContentView
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        // Добавляем все элементы на ContentView
        [logoImageView, emailTextField, passwordTextField, logInButton].forEach {
            contentView.addSubview($0)
        }

        // Отключаем автоматические ограничения
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        logInButton.translatesAutoresizingMaskIntoConstraints = false

        // Устанавливаем ограничения
        NSLayoutConstraint.activate([
            // ScrollView занимает весь экран
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // ContentView заполняет ScrollView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            // Логотип
            logoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),

            // Поле email
            emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

            // Поле пароля
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),

            // Кнопка логина
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }

    // Добавляем наблюдатели для клавиатуры
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            guard let self = self,
                  let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
                return
            }
            // Увеличиваем отступы контента
            let keyboardHeight = keyboardFrame.height
            self.scrollView.contentInset.bottom = keyboardHeight
            self.scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
        }

        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            guard let self = self else { return }
            // Сбрасываем отступы
            self.scrollView.contentInset.bottom = 0
            self.scrollView.verticalScrollIndicatorInsets.bottom = 0
        }
    }

    // Настройка действий
    private func setupActions() {
        logInButton.addTarget(self, action: #selector(logInTapped), for: .touchUpInside)
    }

    // Переход на экран профиля
    @objc private func logInTapped() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }

    // Удаляем наблюдатели при деинициализации
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
