import UIKit

// Класс для отображения публикации в таблице
class PostTableViewCell: UITableViewCell {
    
    // Лейбл для отображения имени автора
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16) // Жирный текст
        label.textColor = .black // Чёрный цвет текста
        label.translatesAutoresizingMaskIntoConstraints = false // Отключаем автоматические ограничения
        return label
    }()
    
    // Изображение публикации
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill // Заполнение без искажения пропорций
        imageView.clipsToBounds = true // Обрезка изображения по границам
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Лейбл для отображения описания публикации
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14) // Обычный текст
        label.textColor = .darkGray // Тёмно-серый цвет
        label.numberOfLines = 0 // Неограниченное количество строк
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Лейбл для отображения количества лайков
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12) // Меньший размер шрифта
        label.textColor = .gray // Серый цвет текста
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Лейбл для отображения количества просмотров
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12) // Меньший размер шрифта
        label.textColor = .gray // Серый цвет текста
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Инициализация
    
    // Инициализация из кода
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews() // Добавляем элементы
        setupConstraints() // Устанавливаем ограничения
    }
    
    // Инициализация из storyboard или xib
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews() // Добавляем элементы
        setupConstraints() // Устанавливаем ограничения
    }
    
    // MARK: - Настройка элементов
    
    private func setupSubviews() {
        // Добавляем UI-элементы в contentView
        contentView.addSubview(authorLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
    }
    
    private func setupConstraints() {
        // Настраиваем Auto Layout для всех элементов
        NSLayoutConstraint.activate([
            // Лейбл автора
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            // Изображение публикации
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 200),
            
            // Лейбл описания
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            // Лейбл лайков
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            // Лейбл просмотров
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8) // Отступ снизу
        ])
    }
    
    // MARK: - Конфигурация ячейки
    
    // Метод для настройки ячейки данными из модели Post
    func configure(with post: Post) {
        authorLabel.text = post.author // Имя автора
        postImageView.image = UIImage(named: post.image) // Изображение
        descriptionLabel.text = post.description // Описание
        likesLabel.text = "Likes: \(post.likes)" // Лайки
        viewsLabel.text = "Views: \(post.views)" // Просмотры
    }
}
