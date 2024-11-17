import UIKit

class ProfileViewController: UIViewController {

    // Создаём экземпляр ProfileHeaderView
    private let headerView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"

        // Добавляем headerView как subview
        view.addSubview(headerView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        // Задаём frame для headerView
        headerView.frame = view.bounds
    }
}
