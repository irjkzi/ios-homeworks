import UIKit

class ProfileViewController: UIViewController {

    // Создаём экземпляр ProfileHeaderView
    private let headerView = ProfileHeaderView()

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

        // Добавляем headerView как subview
        view.addSubview(headerView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        // Задаём frame для headerView
        headerView.frame = view.bounds
    }
}
