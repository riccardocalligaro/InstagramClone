//
//  FeedViewController.swift
//  InstagramClone
//
//  Created by Riccardo on 25/12/20.
//

import UIKit

enum FeedSection {
    case posts
}

struct FeedItem: Hashable {
    let title: String
}

class FeedViewController: UICollectionViewController {
    
    
    typealias DataSource = UICollectionViewDiffableDataSource<FeedSection, FeedItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<FeedSection, FeedItem>
    
    
    private lazy var dataSource = makeDataSource()
    
    let postCellReuseIdentifier = "postCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the navigation bar title
        navigationController?.navigationBar.topItem?.title = "Feed"
        
        view.backgroundColor = .systemBackground
        
        // set up the collection view
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // remember to set the background color for the collection view
        collectionView.backgroundColor = .systemBackground
        
        // set the contraints
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: postCellReuseIdentifier)
        
        // collectionView.delegate = self
        collectionView.dataSource = dataSource
    }
        
    override func viewDidAppear(_ animated: Bool) {
        var snapshot = Snapshot()
        snapshot.appendSections([.posts])
        snapshot.appendItems([FeedItem(title: "Hello world")])
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    // MARK: - Datasource
    private func makeDataSource() -> DataSource {
        return DataSource(
            collectionView: collectionView,
            cellProvider: {(collectionView, indexPath, item) -> UICollectionViewCell? in
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.postCellReuseIdentifier, for: indexPath) as! PostCollectionViewCell
                // set up the cell content
                cell.titleLabel.text = "Hello post colleciton cell!"
                
                return cell
            })
    }
    
}

// MARK: - Coolection view delegate
extension FeedViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // for now simpy deselect the item
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

// MARK: - Flow delegate
extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}
