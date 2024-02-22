//
//  ColorsPreviewViewController.swift
//  UIPreview
//
//  Created by ZHK on 2024/2/22.
//  
//

import UIKit

typealias ColorInfo = (String, UIColor)

class ColorsPreviewViewController: UIViewController {
    
    private lazy var colors: [ColorInfo] = {
        var colors: [ColorInfo] = [
            ("systemRed", .systemRed), ("systemGreen", .systemGreen),
            ("systemBlue", .systemBlue), ("systemOrange", .systemOrange),
            ("systemPink", .systemPink), ("systemTeal", .systemTeal),
            ("systemPurple", .systemPurple), ("systemBrown", .systemBrown),
            ("systemYellow", .systemYellow), ("systemIndigo", .systemIndigo),
            ("systemGray", .systemGray), ("systemGray2", .systemGray2),
            ("systemGray3", .systemGray3), ("systemGray4", .systemGray4),
            ("systemGray5", .systemGray5), ("systemGray6", .systemGray6),
            ("lightText", .lightText), ("darkText", .darkText),
            ("label", .label), ("secondaryLabel", .secondaryLabel),
            ("tertiaryLabel", .tertiaryLabel), ("quaternaryLabel", .quaternaryLabel),
            ("link", .link), ("placeholderText", .placeholderText),
            ("separator", .separator), ("opaqueSeparator", .opaqueSeparator),
            ("systemBackground", .systemBackground),
            ("secondarySystemBackground", .secondarySystemBackground),
            ("tertiarySystemBackground", .tertiarySystemBackground),
            ("systemGroupedBackground", .systemGroupedBackground),
            ("secondarySystemGroupedBackground", .secondarySystemGroupedBackground),
            ("tertiarySystemGroupedBackground", .tertiarySystemGroupedBackground),
            ("systemFill", .systemFill),
            ("secondarySystemFill", .secondarySystemFill),
            ("quaternarySystemFill", .quaternarySystemFill),
            ("tertiarySystemFill", .tertiarySystemFill),
        ]
        

        if #available(iOS 15, *) {
            colors.append(contentsOf: [
                ("systemCyan", .systemCyan), ("systemMint", .systemMint),
                ("tintColor", .tintColor)
            ])
        }
        return colors
    }()
    
    let collectionView: UICollectionView = {
        let width: CGFloat = floor((UIScreen.main.bounds.width - 12) / 4)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: width, height: width + 20)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        title = "Colors"
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.register(ColorPreviewViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}

extension ColorsPreviewViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ColorPreviewViewCell
        cell.color = colors[indexPath.row]
        return cell
    }
}
