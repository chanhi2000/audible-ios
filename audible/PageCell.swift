//
//  PageCell.swift
//  audible
//
//  Created by LeeChan on 9/8/16.
//  Copyright © 2016 MarkiiimarK. All rights reserved.
//

import UIKit

class PageCell: BaseCell {
    
    var page: Page? {
        didSet {
            guard let page = page else {  return  }
            
            var imageName = page.imageName!
            if UIDevice.current.orientation.isLandscape {
                imageName += "_landscape"
            }
            
            imageView.image = UIImage(named: imageName)
            let textColor = UIColor(white:0.2, alpha: 1)
            let titleAttributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium),
                NSAttributedString.Key.foregroundColor: textColor
            ]
            let attributedText = NSMutableAttributedString(string: page.title!, attributes: titleAttributes)
            
            let stringAttributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                NSAttributedString.Key.foregroundColor: textColor
            ]
            let attributedString = NSAttributedString(string: "\n\n\(page.message!)", attributes: stringAttributes)
            
            attributedText.append(attributedString)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let length = attributedText.string.count
            
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            textView.attributedText = attributedText
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .yellow
        iv.image = UIImage(named: "page1")
        return iv
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "SAMPLE TEXT FOR NOW"
        tv.isEditable = false
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        tv.translatesAutoresizingMaskIntoConstraints = false
        
        return tv
    }()
    
    let lineSepaaratorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addSubview(textView)
        addSubview(lineSepaaratorView)
        
        imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        textView.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        lineSepaaratorView.anchorToTop(top: nil, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        lineSepaaratorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
}
