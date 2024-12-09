import UIKit

class LogInViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    // Логотип приложения
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "VKLogo")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()

    // Поле для ввода email или телефона
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or phone"
        textField.borderStyle = .none
        textField.backgroundColor = .systemGray6
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.returnKeyType = .next
        textField.clipsToBounds = true

        // Добавление стандартных отступов для текста
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 40))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()

    // Поле для ввода пароля
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .none
        textField.backgroundColor = .systemGray6
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        textField.clipsToBounds = true

        // Добавление стандартных отступов для текста
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 40))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()

    // Кнопка входа
    private let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        return button
    }()

    // Разделитель между текстовыми полями
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    // Стек с текстовыми полями
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, dividerView, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.layer.cornerRadius = 10
        stackView.layer.masksToBounds = true
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        return stackView
    }()

    // MARK: - Жизненный цикл ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    // MARK: - Настройка интерфейса

    private func setupUI() {
        setupBackground()
        setupScrollView()
        setupContentView()
        setupSubviews()
        setupConstraints()
    }

    // Установка фонового цвета
    private func setupBackground() {
        view.backgroundColor = .white
    }

    // Настройка scrollView
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }

    // Настройка contentView внутри scrollView
    private func setupContentView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }

    // Добавление всех сабвью
    private func setupSubviews() {
        contentView.addSubview(logoImageView)
        contentView.addSubview(stackView)
        contentView.addSubview(logInButton)

        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false
    }

    // Установка всех ограничений
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // ScrollView constraints
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // ContentView constraints
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            // Logo constraints
            logoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),

            // StackView constraints
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),

            // Divider constraints
            dividerView.heightAnchor.constraint(equalToConstant: 0.5),
            dividerView.widthAnchor.constraint(equalTo: stackView.widthAnchor),

            // Button constraints
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }

    // MARK: - Действия

    private func setupActions() {
        logInButton.addTarget(self, action: #selector(logInTapped), for: .touchUpInside)
    }

    @objc private func logInTapped() {
        print("Log In button tapped")
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }

    // Удаление наблюдателей уведомлений
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
            logInTapped()
        }
        return true
    }
}
