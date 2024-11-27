import UIKit

// Структура для хранения констант, используемых в ProfileHeaderView
struct ProfileHeaderConstants {
    
    // Отступы между элементами и краями (например, для аватара, текста, кнопки)
    static let padding: CGFloat = 16
    
    // Размер аватара (ширина и высота)
    static let avatarSize: CGFloat = 100
    
    // Радиус скругления для кнопок и текстовых полей
    static let cornerRadius: CGFloat = 12
    
    // Фиксированная высота кнопки
    static let buttonHeight: CGFloat = 50
    
    // Фиксированная высота текстового поля
    static let textFieldHeight: CGFloat = 40
    
    // Отступ между аватаром и текстовыми элементами (например, именем пользователя)
    static let labelToAvatarOffset: CGFloat = 27
    
    // Отступ между строками текста (например, статусом и текстовым полем)
    static let spacingBetweenLabels: CGFloat = 8
    
    // Смещение тени для кнопки (горизонтальное и вертикальное)
    static let buttonShadowOffset = CGSize(width: 4, height: 4)
    
    // Прозрачность тени кнопки (0.0 — полностью прозрачная, 1.0 — полностью непрозрачная)
    static let shadowOpacity: Float = 0.7
    
    // Радиус размытия тени кнопки
    static let shadowRadius: CGFloat = 4
}
