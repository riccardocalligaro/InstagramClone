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
        
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "tray.2"), tag: 0)
        searchViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        self.viewControllers = [feedViewController, searchViewController]
    }
    


}

