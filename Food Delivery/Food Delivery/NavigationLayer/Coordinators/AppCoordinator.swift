//
//  AppCoordinator.swift
//  Food Delivery
//
//  Created by Tanya on 07.03.2024.
//
    
import UIKit

class AppCoordinator: Coordinator {
    
//    private let userStorage = UserStorage.shared
//    private let factory = SceneFactory.self
    
    override func start() {
        
//      showOnboardingFlow()
     showMainFlow()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
    
}

// MARK: - Navigation methods

private extension AppCoordinator {
    
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: navigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "homekit"),tag: 0)
        
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = HomeCoordinator(type: .order, navigationController: navigationController)
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage.init(systemName: "doc.badge.plus"),tag: 1)
        orderCoordinator.finishDelegate = self
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = HomeCoordinator(type: .list, navigationController: navigationController)
        listNavigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "list.bullet.clipboard"),tag: 2)
        listCoordinator.finishDelegate = self
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = HomeCoordinator(type: .profile, navigationController: navigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "person.crop.circle"),tag: 3)
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()
        
        addChildCoordinator(homeCoordinator)
        addChildCoordinator(orderCoordinator)
        addChildCoordinator(listCoordinator)
        addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [ homeNavigationController,
                                  orderNavigationController,
                                  listNavigationController,
                                  profileNavigationController ]
                                 
        let tabBarController = TabBarController(tabBarControllers:tabBarControllers)
        
       navigationController.pushViewController(tabBarController,animated: true)
        
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinators: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinators)
        
        switch childCoordinators.type {
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showMainFlow()
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
