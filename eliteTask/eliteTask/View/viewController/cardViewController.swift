//
//  cardViewController.swift
//  eliteTask
//
//  Created by Allnet Systems on 7/15/24.
//

import UIKit
import NVActivityIndicatorView

class cardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let viewModel = mainViewModel()
    @IBOutlet weak var collectionView: UICollectionView!
    var activityIndicator: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: self.view.bounds.width / 2 - 25, y: self.view.bounds.height / 2 - 25, width: 45, height: 45)
        activityIndicator = NVActivityIndicatorView(frame: frame, type: .ballRotate, color: .blue, padding: nil)
        self.view.addSubview(activityIndicator)
        activityIndicator.isHidden = false
        collectionSetup()
        viewModelBinding()
        fetchData()
    }
    
    func collectionSetup() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "cardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cardCollectionViewCell")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: collectionView.frame.width * 0.9, height: collectionView.frame.height)
        layout.minimumLineSpacing = 2
        layout.sectionInset = UIEdgeInsets(top: 0, left: (collectionView.frame.width - layout.itemSize.width) / 2, bottom: 0, right: (collectionView.frame.width - layout.itemSize.width) / 2)
        collectionView.collectionViewLayout = layout
    }
    
    func fetchData() {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        viewModel.fetchProfiles()
    }
    
    func viewModelBinding() {
        viewModel.onProfilesUpdated = { [weak self] in
            self?.collectionView.reloadData()
            self?.stopActivityIndicator()
        }
        
        viewModel.onError = { [weak self] errorMessage in
            let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self?.present(alert, animated: true, completion: nil)
            self?.stopActivityIndicator()
        }
    }
    
    func stopActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.isHidden = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfProfiles
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCollectionViewCell", for: indexPath) as! cardCollectionViewCell
        
        let profile = viewModel.getProfile(at: indexPath.row)
        cell.nameLabel.text = "\(profile.profile_first_name ?? "") \(profile.profile_last_name ?? "")"
        cell.companyLabel.text = "\(profile.profile_job_title ?? "") at \(profile.profile_company_name ?? "")"
        if indexPath.item == 1 || indexPath.item == 3 {
            cell.switchControl.isOn = false
        }
        
//        if let imageUrlString = profile.profile_image_name, let imageUrl = URL(string: imageUrlString) {
//            serviceFile.shared.downloadImage(from: imageUrl) { image in
//                DispatchQueue.main.async {
//                    cell.userimage.image = image
//                }
//            }
//        } else {
//            cell.userimage.image = UIImage(named: "placeholder")
//        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.width
        let cellWidth = collectionViewWidth * 0.9
        let cellHeight = collectionView.frame.height
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
