//
//  OnBoardingViewController.swift
//  arcweather-ios
//
//  Created by Analu Lisboa on 3/7/22.
//

import UIKit

class OnBoardingViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var onboardingImage: UIImageView!
    @IBOutlet weak var onboardingTitle: UILabel!
    @IBOutlet weak var onboardingDescription: UILabel!
    @IBOutlet weak var onboardingPageControl: UIPageControl!
    @IBOutlet weak var onboardingSkipBtn: UIButton!
    @IBOutlet weak var onboardingNextBtn: UIButton!

    // MARK: - Properties
    var index: Int = 0 {
        didSet {
            viewUpdate()
        }
    }

    var content = [ OnBoarding(title: "Welcome to ArcWeather",
                                  description: "Your new favorite weather app, with all the features you need to have the best information available.",
                                  image: "OnBoardingPage01" ),
                       OnBoarding(title: "Follow different places",
                                  description: "You can easily add as many different locations as you wish.",
                                  image: "OnBoardingPage02" ),
                       OnBoarding(title: "Never forget your umbrella",
                                  description: "Accurate weather forecast that you can trust to never get caught in the rain again.",
                                  image: "OnBoardingPage03" ) ]

    // MARK: - Methods

    override func viewDidLoad() {

    }

    @IBAction func didTapNextButton(_ sender: Any) {

        if index >= 0 && index < content.count - 1 {
            index += 1

        }

        self.view.layoutIfNeeded()

    }

    private func viewUpdate() {

        onboardingImage.image = UIImage(named: content[index].image)

        onboardingTitle.text = content[index].title

        onboardingDescription.text = content[index].description

        if index == 2 {
            onboardingSkipBtn.isHidden = true
        }

        onboardingPageControl.currentPage = index

    }

}
