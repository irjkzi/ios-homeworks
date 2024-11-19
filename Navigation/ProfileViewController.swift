import UIKit

class ProfileViewController: UIViewController {

    // Создаём экземпляр ProfileHeaderView
    private let headerView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false // Включаем Auto Layout
        return view
    }()

    // Создаём новую кнопку
    private let newButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("New Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()

    // Настройка цвета статус-бара
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent // Темный текст на светлом фоне
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"

        // Настройка appearance для навигационного бара
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1) // Цвет #F3F3F3
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.black, // Чёрный цвет текста
            .font: UIFont.systemFont(ofSize: 20, weight: .bold) // Жирный шрифт заголовка
        ]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        // Устанавливаем фон statusBar
        if #available(iOS 15, *) {
            navigationController?.navigationBar.compactAppearance = appearance
        }

        // Добавляем элементы на экран
        view.addSubview(headerView)
        view.addSubview(newButton)

        // Настраиваем Auto Layout
        setupConstraints()
    }

    // Устанавливаем Auto Layout Constraints
    private func setupConstraints() {
        // Constraints для headerView
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 220) // Высота headerView фиксированная
        ])

        // Constraints для новой кнопки
        NSLayoutConstraint.activate([
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newButton.heightAnchor.constraint(equalToConstant: 50) // Высота кнопки фиксированная
        ])
    }
}

