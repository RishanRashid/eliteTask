//
//  cardCollectionViewCell.swift
//  eliteTask
//
//  Created by Allnet Systems on 7/15/24.
//

import UIKit

class cardCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var switchControl: UISwitch!
    @IBOutlet weak var userimage: UIImageView!
    @IBOutlet weak var greenimage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
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
    }
   
 
    func viewSetup(){
        profileView.applyCornerRadius(10)
        profileView.applyShadow()
        
        toggleView.applyCornerRadius(10)
        toggleView.applyShadow()
        
        View1.applyCornerRadius(10)
        View1.applyShadow()
        View2.applyCornerRadius(10)
        View2.applyShadow()
        
        View4.applyCornerRadius(10)
        View4.applyShadow()
        View3.applyCornerRadius(10)
        View3.applyShadow()
        
 
        userimage.applyCornerRadius(userimage.frame.size.width / 2)
        userimage.applyBorder(width: 3.0, color: UIColor.white)
        
        greenimage.roundTopCorners(radius: 10)
        writeNFCButton.backgroundColor = .systemGray5
        previewButton.backgroundColor = .systemGray5
        
    }
    
    
}
