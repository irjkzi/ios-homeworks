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
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Создаем окно для приложения
        window = UIWindow(windowScene: windowScene)

        // Создаем TabBarController
        let tabBarController = UITabBarController()

        // Создаем контроллеры Feed и Profile
        let feedVC = FeedViewController()
        let profileVC = LogInViewController()

        // Создаем UINavigationController для каждого контроллера
        let feedNavController = UINavigationController(rootViewController: feedVC)
        let profileNavController = UINavigationController(rootViewController: profileVC)

        // Настраиваем Tab Bar Items для контроллеров
        feedNavController.tabBarItem = UITabBarItem(
            title: "Feed",
            image: UIImage(systemName: "list.bullet"),
            tag: 0
        )
        profileNavController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.circle"),
            tag: 1
        )

        // Настраиваем внешний вид TabBar
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0) // Светло-серый фон

        // Настраиваем цвета для активных и неактивных элементов
        let activeColor = UIColor(red: 139/255, green: 0/255, blue: 0/255, alpha: 1.0) // Бордовый
        let inactiveColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1.0) // Темно-серый

        // Устанавливаем цвет для неактивных и активных элементов
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = inactiveColor
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: inactiveColor]
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = activeColor
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: activeColor]

        // Применяем изменения к таб-бару
        tabBarController.tabBar.standardAppearance = tabBarAppearance
        if #available(iOS 15.0, *) {
            tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance
        }

        // Добавляем контроллеры в TabBarController
        tabBarController.viewControllers = [feedNavController, profileNavController]

        // Устанавливаем rootViewController для окна
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}



    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }




