//
//  OnboardingScreen.swift
//  TowardsBook
//
//  Created by Maheen on 21/10/2022.
//

import UIKit

class OnboardingScreen: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [
            OnboardingSlide(title: "Grow Together", description: "Reading is the gateway skill that makes all other learning possible", image: #imageLiteral(resourceName: "slide2")),
            OnboardingSlide(title: "World-Class Books", description: "A book is a gift you can open again and again.", image: #imageLiteral(resourceName: "slide1")),
            OnboardingSlide(title: "More And More", description: "The More that you read, the More things You will know. The More that you learn.", image: #imageLiteral(resourceName: "slide3"))
        ]
        pageControl.numberOfPages = slides.count
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "TabBarView") as! UITabBarController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)  {
            super.viewWillTransition(to: size, with: coordinator)
            collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension OnboardingScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingViewCell.identifier, for: indexPath) as! OnboardingViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
       }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        let indexPath = IndexPath(item: currentPage, section: 0)
         collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
