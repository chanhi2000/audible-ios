//
//  PageCell.swift
//  audible
//
//  Created by LeeChan on 4/9/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    let imageView: UIImageView = {
        let imgv = UIImageView()
        imgv.backgroundColor = .yellow
        imgv.contentMode = .scaleAspectFill
        imgv.clipsToBounds = true
        imgv.image = #imageLiteral(resourceName: "page1")
        return imgv
    }()
    
    func setupViews() {
        backgroundColor = .blue
        
        addSubview(imageView)
        imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
