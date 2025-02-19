//
//  OnboardingCollectionViewCell.swift
//  Test
//
//  Created by Gaurav Patel on 19/02/25.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    @IBOutlet weak var onboardingImg: UIImageView!
    @IBOutlet weak var lblPrimary: UILabel!
    @IBOutlet weak var lblSecondary: UILabel!
    
    static let identifier = "OnboardingCell"
    
    func configureCell(_ model: OnboardingSwipeSceneModel) {
        onboardingImg.image = model.onboardingImage
//        lblPrimary.font = .montserratBold(size: 36)
        lblPrimary.text = model.primaryTitle
        
//        lblPrimary.font = .montserratMedium(size: 20)
        lblSecondary.text = model.secondaryTitle
        
    }
}
