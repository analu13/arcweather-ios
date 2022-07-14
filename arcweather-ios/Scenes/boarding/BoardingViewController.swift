//
//  BoardingViewController.swift
//  arcweather-ios
//
//  Created by Analu Lisboa on 01/07/22.
//

import UIKit

class BoardingViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var skipButton: UIButton!

    @IBOutlet weak var mainImage: UIImageView!

    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var mainTitle: UILabel!

    @IBOutlet weak var mainDescription: UILabel!

    @IBOutlet weak var nextButton: UIButton!

    // MARK: - Properties

    var content = [ OnBoarding(title: "Welcome to ArcWeather",
                               description: "Your new favorite weather app, with all the features you need to have the best information available.",
                               image: "OnBoardingPage01" ),
                    OnBoarding(title: "Follow different places",
                               description: "You can easily add as many different locations as you wish.",
                               image: "OnBoardingPage02" ),
                    OnBoarding(title: "Never forget your umbrella",
                               description: "Accurate weather forecast that you can trust to never get caught in the rain again.",
                               image: "OnBoardingPage03" ) ]

    var boardingPageViewController: BoardingPageViewController?

    var boardingIndex = 0

    // MARK: - Actions

    @IBAction func skipButtonTapped(sender: UIButton) {
        // TODO
    }

    @IBAction func nextButtonTapped(sender: UIButton) {

        if boardingIndex >= 0 && boardingIndex < content.count - 1 {
            boardingIndex += 1
        }

        didUpdatePageIndex(currentIndex: boardingIndex)
        boardingPageViewController?.forwardPage()
        updateUI()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }

}

extension BoardingViewController {

    static func getInstance (index: Int) -> BoardingViewController {
        let viewController = UIStoryboard(name: "boarding", bundle: nil).instantiateViewController(withIdentifier: "BoardingViewController") as! BoardingViewController
        viewController.boardingIndex = index
        return viewController
    }

    func updateUI () {

        self.mainImage.image = UIImage(named: content[boardingIndex].image)
        self.mainTitle.text = content[boardingIndex].title
        self.mainDescription.text = content[boardingIndex].description

        if boardingIndex == content.count - 1 {
            self.skipButton.isHidden = true
            self.nextButton.setTitle("Done", for: .normal)
        }

        pageControl.currentPage = boardingIndex

    }

}

extension BoardingViewController: BoardingPageViewControllerDelegate {
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
}
