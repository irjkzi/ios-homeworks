//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Николай Иванов on 26.10.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Проверяем, что `scene` является экземпляром UIWindowScene
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Создаём окно для отображения интерфейса
        window = UIWindow(windowScene: windowScene)

        // Создаём TabBarController
        let tabBarController = UITabBarController()

        // Создаём экземпляры контроллеров Feed и Profile
        let feedVC = FeedViewController() // Экран ленты
        let profileVC = LogInViewController() // Экран авторизации

        // Оборачиваем контроллеры в UINavigationController
        let feedNavController = UINavigationController(rootViewController: feedVC)
        let profileNavController = UINavigationController(rootViewController: profileVC)

        // Настраиваем элементы таб-бара для каждого контроллера
        feedNavController.tabBarItem = UITabBarItem(
            title: "Feed", // Название вкладки
            image: UIImage(systemName: "list.bullet"), // Иконка
            tag: 0 // Индекс вкладки
        )
        profileNavController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.circle"),
            tag: 1
        )

        // Настройка внешнего вида TabBar
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0) // Светло-серый фон

        // Настройка цветов для активных и неактивных элементов
        let activeColor = UIColor(red: 139/255, green: 0/255, blue: 0/255, alpha: 1.0) // Бордовый
        let inactiveColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1.0) // Тёмно-серый

        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = inactiveColor // Цвет иконок в неактивном состоянии
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: inactiveColor] // Цвет текста
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = activeColor // Цвет иконок в активном состоянии
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: activeColor] // Цвет текста

        // Применяем изменения к TabBar
        tabBarController.tabBar.standardAppearance = tabBarAppearance
        if #available(iOS 15.0, *) {
            tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance // Для iOS 15 и выше
        }

        // Устанавливаем контроллеры TabBarController
        tabBarController.viewControllers = [feedNavController, profileNavController]

        // Устанавливаем TabBarController как rootViewController
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    // MARK: - Методы жизненного цикла сцены

    func sceneDidDisconnect(_ scene: UIScene) {
        // Вызывается, когда сцена отключается системой.
        // Используется для очистки ресурсов, связанных с этой сценой.
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Вызывается, когда сцена переходит из неактивного состояния в активное.
        // Здесь можно перезапустить задачи, которые были приостановлены.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Вызывается, когда сцена переходит из активного состояния в неактивное.
        // Например, при входящем звонке.
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Вызывается, когда сцена возвращается из фона в передний план.
        // Используется для отмены изменений, выполненных при уходе в фон.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Вызывается, когда сцена переходит из переднего плана в фон.
        // Используется для сохранения данных и освобождения ресурсов.
    }
}
