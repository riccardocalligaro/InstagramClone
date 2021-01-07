//
//  PostCollectionViewCell.swift
//  InstagramClone
//
//  Created by Riccardo on 26/12/20.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        return l
    }()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "spiderman"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    private lazy var userButton: UIButton = {
        let button = UIButton(type: .system)
        // use label for dynamic theming
        button.setTitleColor(.label, for: .normal)
        // set the content
        button.setTitle("spiderman11", for: .normal)
        // set it to bold
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        // add the tap action
        button.addTarget(self, action: #selector(didTapUsernameButton), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // set up the cell
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(profileImageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 16)
        
        profileImageView.setDimensions(height: 48, width: 48)
        profileImageView.layer.cornerRadius = 48 / 2
        
        contentView.addSubview(userButton)
        
        userButton.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 16)
        
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        titleLabel.backgroundColor = .systemRed
    }
    
    @objc func didTapUsernameButton() {
        debugPrint("Tapped on username...")
    }
}
