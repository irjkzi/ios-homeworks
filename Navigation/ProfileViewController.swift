import UIKit

class ProfileViewController: UIViewController {

    // Таблица для отображения постов с группированным стилем
    private let tableView = UITableView(frame: .zero, style: .grouped)
    // Массив постов для отображения в таблице
    private let posts = Post.samplePosts

    override func viewDidLoad() {
        super.viewDidLoad()
        // Устанавливаем белый фон экрана
        view.backgroundColor = .white
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Убираем кнопку "Назад"
        navigationItem.hidesBackButton = true
    }

    // Настройка таблицы
    private func setupTableView() {
        // Назначаем делегата и источник данных
        tableView.delegate = self
        tableView.dataSource = self
        // Настраиваем автоматическую адаптацию таблицы
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.contentInsetAdjustmentBehavior = .automatic
        // Добавляем таблицу на экран
        view.addSubview(tableView)

        // Регистрируем ячейку для таблицы
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        // Устанавливаем ограничения для таблицы
        setupTableViewConstraints()
    }

    // Установка ограничений для таблицы
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    // Возвращаем количество строк в таблице
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    // Настраиваем содержимое ячейки для строки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: posts[indexPath.row])
        return cell
    }

    // Устанавливаем высоту заголовка секции
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 200 : 0
    }

    // Настраиваем отображение заголовка секции
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = ProfileHeaderView()
            headerView.backgroundColor = .white
            return headerView
        }
        return nil
    }
}
