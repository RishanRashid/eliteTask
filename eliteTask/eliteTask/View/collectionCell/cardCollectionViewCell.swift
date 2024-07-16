//
//  cardCollectionViewCell.swift
//  eliteTask
//
//  Created by Allnet Systems on 7/15/24.
//

import UIKit

class cardCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var userimage: UIImageView!
    @IBOutlet weak var greenimage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var View2: UIView!
    @IBOutlet weak var View3: UIView!
    @IBOutlet weak var View4: UIView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var toggleView: UIView!
    @IBOutlet weak var componentView: UIView!
    
    @IBOutlet weak var writeNFCButton: UIButton!
    @IBOutlet weak var previewButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewSetup()
        writeNFCButton.backgroundColor = .lightGray
        previewButton.backgroundColor = .lightGray
    }
    
    
    func viewSetup(){
        View1.applyShadow()
        View1.applyCornerRadius(10)
        
        View2.applyShadow()
        View2.applyCornerRadius(10)
        
        View3.applyShadow()
        View3.applyCornerRadius(10)
        
        View4.applyShadow()
        View4.applyCornerRadius(10)
        toggleView.applyShadow()
        toggleView.applyCornerRadius(10)
        
        profileView.applyShadow()
        profileView.applyCornerRadius(10)
        
        userimage.applyCornerRadius(userimage.frame.size.width / 2)
        userimage.applyBorder(width: 3.0, color: UIColor.white)
        
        greenimage.roundTopCorners(radius: 10)
        
    }
    
    
}
