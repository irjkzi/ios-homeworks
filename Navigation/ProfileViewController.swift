import UIKit

// Контроллер для отображения профиля пользователя
class ProfileViewController: UIViewController {

    // Таблица для отображения постов
    private let tableView = UITableView()
    
    // Массив публикаций, который будет отображаться в таблице
    private let posts = Post.samplePosts

    // MARK: - Жизненный цикл контроллера

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Устанавливаем белый фон для экрана
        view.backgroundColor = .white
        
        // Настраиваем фон за статус-баром
        setupStatusBarBackground()
        
        // Настраиваем таблицу
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Настраиваем навигационную панель (убираем прозрачность и добавляем белый фон)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage() // Убираем тень
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
    }
    
    // MARK: - Настройка фона для статус-бара

    private func setupStatusBarBackground() {
        // Создаём view для белого фона за статус-баром
        let statusBarBackground = UIView()
        statusBarBackground.backgroundColor = .white
        statusBarBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statusBarBackground)
        
        // Настраиваем Auto Layout для statusBarBackground
        NSLayoutConstraint.activate([
            statusBarBackground.topAnchor.constraint(equalTo: view.topAnchor),
            statusBarBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBarBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusBarBackground.heightAnchor.constraint(equalToConstant: getStatusBarHeight())
        ])
    }
    
    // Получаем высоту статус-бара
    private func getStatusBarHeight() -> CGFloat {
        if let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height {
            return statusBarHeight
        } else {
            return 20 // Стандартная высота для iOS до версии 13
        }
    }
    
    // MARK: - Настройка таблицы

    private func setupTableView() {
        // Настройка делегатов таблицы
        tableView.delegate = self
        tableView.dataSource = self
        
        // Отключаем автоматические ограничения
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // Устанавливаем белый фон для таблицы
        tableView.backgroundColor = .white
        
        // Настраиваем поведение при изменении размеров
        tableView.contentInsetAdjustmentBehavior = .automatic

        // Добавляем таблицу на экран
        view.addSubview(tableView)
        
        // Регистрируем класс ячейки
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        
        // Настраиваем Auto Layout для таблицы
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // Настраиваем стиль текста в статус-баре (тёмный текст)
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}

// MARK: - Расширение для работы с UITableView

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    // Количество строк в таблице
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    // Настройка содержимого ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        // Конфигурируем ячейку данными из модели Post
        cell.configure(with: posts[indexPath.row])
        return cell
    }
    
    // Высота заголовка секции
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 200 : 0 // Высота только для первой секции
    }
    
    // Настройка вида заголовка секции
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            // Создаём header для первой секции
            let headerView = ProfileHeaderView()
            headerView.backgroundColor = .white
            return headerView
        }
        return nil
    }
}
