//
//  ViewController.swift
//  InstagramClone
//
//  Created by Riccardo on 25/12/20.
//

import UIKit

class NavigatorViewController: UITabBarController {

    // MARK: - Tab set up
    
    override func viewWillAppear(_ animated: Bool) {
        // set up the tab items
        let feedViewController = UINavigationController(rootViewController: FeedViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "tray.2"), tag: 0)
        
        self.viewControllers = [feedViewController]
    }
    


}

