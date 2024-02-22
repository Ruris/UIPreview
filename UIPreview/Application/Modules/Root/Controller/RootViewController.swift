//
//  ViewController.swift
//  UIPreview
//
//  Created by ZHK on 2024/2/22.
//  
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(1)
        // Do any additional setup after loading the view.
    }

}

extension RootViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
    
}

extension RootViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(ColorsPreviewViewController(), animated: true)
    }
}

