//
//  ProfileCoordinator.swift
//  Food Delivery
//
//  Created by Tanya on 07.03.2024.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    override func start() {
            let vc = ViewController()
            vc.view.backgroundColor = .yellow
            navigationController?.pushViewController(vc, animated: true)
        }
        
        override func finish() {
            print("AppCoordinator finish")
        }
        
    }


