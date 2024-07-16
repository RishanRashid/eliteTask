//
//  cardViewController.swift
//  eliteTask
//
//  Created by Allnet Systems on 7/15/24.
//

import UIKit

class cardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let viewModel = mainViewModel()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionSetup()
//        viewModelBinding()
//        fetchData()
    }
    
    
    func collectionSetup(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "cardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cardCollectionViewCell")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        layout.minimumLineSpacing = 2
        collectionView.collectionViewLayout = layout
}
    
    func fetchData() {
            viewModel.fetchProfiles()
        }
    
        
     func viewModelBinding() {
           viewModel.onProfilesUpdated = { [weak self] in
               self?.collectionView.reloadData()
           }
           
           viewModel.onError = { [weak self] errorMessage in
               let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               self?.present(alert, animated: true, completion: nil)
           }
       }
    
    
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          //  return viewModel.numberOfProfiles
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCollectionViewCell", for: indexPath) as! cardCollectionViewCell
            
            return cell
        }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.width
        let cellWidth = collectionViewWidth * (0.90) 
        let cellHeight = collectionView.frame.height
        return CGSize(width: cellWidth, height: cellHeight)
    }

    }
