//
//  OnboardingViewController.swift
//  Explora
//
//  Created by Gaurav Patel on 19/02/25.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizePageControl()
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        customizePageControl()
    }
    
    var currentPage = 0 {
        didSet {
            customizePageControl()
            if currentPage == onboardingData.count - 1 {
            } else {
            }
            pageControl.currentPage = currentPage
        }
    }
    
    // Array that holds Model data and gonna display the content of slide scene.
    let onboardingData: [OnboardingSwipeSceneModel] = [
        OnboardingSwipeSceneModel(
            onboardingImage: UIImage(
                named: "imgSlideScreenOne"
            )!,
            primaryTitle: """
        Explore the
        world easily
        """,
            secondaryTitle: "To your desire"
        ),
        
        OnboardingSwipeSceneModel(
            onboardingImage: UIImage(
                named: "imgSlideScreenTwo"
            )!,
            primaryTitle: """
        Reach the
        unknown spot
        """,
            secondaryTitle: "To your destination"
        ),
        
        OnboardingSwipeSceneModel(
            onboardingImage: UIImage(
                named: "imgSlideScreenThree"
            )!,
            primaryTitle: """
        Make connects
        with explora
        """,
            secondaryTitle: "To your dream trip"
        )
    ]

    func customizePageControl() {
        pageControl.setIndicatorImage(UIImage(named: "page-off"), forPage: currentPage)
        if #available(iOS 16.0, *) {
            pageControl.setCurrentPageIndicatorImage(UIImage(named: "page-on") , forPage: currentPage)
        } else {
            // Fallback on earlier versions
        }
    }
    
    @IBAction func btnNextPressed(_ sender: Any) {
        
        if currentPage == onboardingData.count-1 {
            print("Goes to the Login Screen")
        } else {
            currentPage += 1
           
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}

// MARK: - Delegate of CollectionView
extension OnboardingViewController: UICollectionViewDelegate {
    // Here view is finished with scrolling/swiping
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int((scrollView.contentOffset.x + width / 2) / width)
        print(currentPage)
        pageControl.currentPage = currentPage
    }
}

// MARK: - DataSource of CollectionView
extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.identifier, for: indexPath) as! OnboardingCell
        cell.configureCell(onboardingData[indexPath.row])
        return cell
    }
}

// MARK: - DataSource of CollectionView
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}
