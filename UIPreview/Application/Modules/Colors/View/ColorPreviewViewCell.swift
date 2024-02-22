//
//  ColorPreviewViewCell.swift
//  UIPreview
//
//  Created by ZHK on 2024/2/22.
//  
//

import UIKit

class ColorPreviewViewCell: UICollectionViewCell {
    
    let colorView = UIView()
    
    let nameLabel = UILabel()
    
    public var color: ColorInfo? {
        didSet {
            if let color = color {
                colorView.backgroundColor = color.1
                nameLabel.text = color.0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(colorView)
        contentView.addSubview(nameLabel)
        
        colorView.layer.cornerRadius = 5.0
        
        nameLabel.font = .systemFont(ofSize: 12)
        nameLabel.textAlignment = .center
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        colorView.frame = CGRect(
            x: 10,
            y: 10,
            width: bounds.width - 20,
            height: bounds.width - 20
        )
        nameLabel.frame = CGRect(
            x: 5,
            y: colorView.frame.maxY + 5,
            width: bounds.width - 10,
            height: bounds.height - colorView.frame.maxY - 10
        )
    }
}
