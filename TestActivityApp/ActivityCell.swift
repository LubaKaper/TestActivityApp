//
//  ActivityCell.swift
//  TestActivityApp
//
//  Created by Liubov Kaper  on 4/15/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import UIKit

class ActivityCell: UICollectionViewCell {
     public lazy var actionImage: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(systemName: "person.fill")
            image.backgroundColor = .systemBackground
            image.contentMode = .scaleToFill
            return image
        }()
        
        public lazy var stepsLabel: UILabel = {
               let label = UILabel()
               label.backgroundColor = .cyan
               label.text = "Step 1"
               label.numberOfLines = 0
              // label.textAlignment = .left
               label.font = UIFont.preferredFont(forTextStyle: .headline)
               return label
           }()
        
        public lazy var addMediaButton: UIButton = {
            let button = UIButton()
            button.tintColor = .systemGray
            button.setImage(UIImage(systemName: "photo.fill"), for: .normal)
            //let imageConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .black, scale: .large)
           // button.setImage(UIImage(systemName: "ellipsis", withConfiguration: imageConfig), for: .normal)
           // button.addTarget(self, action: #selector(moreButtonPressed(_:)), for: .touchUpInside)
            
            return button
        }()
        
        override init(frame: CGRect) {
            super.init(frame: UIScreen.main.bounds)
            commonInit()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            commonInit()
        }
        
        private func commonInit() {
            setUpStepLabelConstraints()
            setUpActionImageConstraints()
            
            
            //setupMoreButtonConstraints()
        }
        
        
        private func setUpActionImageConstraints(){
            addSubview(actionImage)
            actionImage.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                actionImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                actionImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
                actionImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
                actionImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75)
            ])
        }
    
    private func setUpStepLabelConstraints() {
        addSubview(stepsLabel)
        stepsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stepsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stepsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            stepsLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.10)
        ])
    }
    
    public func configureCell(for mediaObject: MediaObject) {
        if let imageData = mediaObject.imageData {
            actionImage.image = UIImage(data: imageData)
        }
        if let videoURL = mediaObject.videoURL {
            let image = videoURL.videoPreviewThumbnail() ?? UIImage(systemName: "heart")
            actionImage.image = image
        }
    }
        
    }




    class HeaderView: UICollectionReusableView {
        
        public lazy var headerLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .cyan
            label.text = "Directions"
            label.numberOfLines = 0
            label.textAlignment = .center
            label.font = UIFont.preferredFont(forTextStyle: .headline)
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: UIScreen.main.bounds)
            commonInit()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            commonInit()
        }
        
        private func commonInit() {
            setupHeaderLabelConstraints()
            
        }

        private func setupHeaderLabelConstraints() {
            addSubview(headerLabel)
            headerLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            ])
        }
}
