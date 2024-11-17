import UIKit

class ProfileViewController: UIViewController {

    // Создаём экземпляр ProfileHeaderView
    private let headerView = ProfileHeaderView()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent // Белый фон, тёмный текст для статус-бара
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"

        // Настройка appearance для навигационного бара
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white // Белый фон навигационного бара
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.black, // Чёрный цвет текста
            .font: UIFont.systemFont(ofSize: 20, weight: .bold) // Шрифт и размер текста
        ]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        // Добавляем headerView как subview
        view.addSubview(headerView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        // Задаём frame для headerView
        headerView.frame = view.bounds
    }
}
