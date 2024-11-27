//
//  Post.swift
//  Navigation
//
//  Created by Николай Иванов on 27.11.2024.
//

import Foundation

// Модель данных для представления публикации
struct Post {
    let author: String       // Имя автора публикации
    let description: String  // Текст описания публикации
    let image: String        // Название изображения в каталоге Assets.xcassets
    let likes: Int           // Количество лайков публикации
    let views: Int           // Количество просмотров публикации

    // Пример массива публикаций для тестирования
    static let samplePosts: [Post] = [
        Post(
            author: "John Doe",
            description: "Amazing sunset!",
            image: "sunset",
            likes: 123,
            views: 456
        ),
        Post(
            author: "Jane Smith",
            description: "Hiking in the mountains.",
            image: "mountains",
            likes: 98,
            views: 324
        ),
        Post(
            author: "Alice",
            description: "Delicious homemade cake.",
            image: "cake",
            likes: 203,
            views: 657
        ),
        Post(
            author: "Bob",
            description: "Exploring the city streets.",
            image: "city",
            likes: 67,
            views: 189
        )
    ]
}
