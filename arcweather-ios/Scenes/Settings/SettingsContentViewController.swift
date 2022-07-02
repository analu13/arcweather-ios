//
//  SettingsContentViewController.swift
//  arcweather-ios
//
//  Created by Analu Lisboa on 01/07/22.
//

import UIKit

class SettingsContentViewController: UIViewController, SettingsPageViewControlleDelegate {

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    var settingsPageViewController: SettingsPageViewController?

    var index = 0
    var label = ""

    @IBAction func didNextButtonTaped(_ sender: UIButton) {
        if let index = settingsPageViewController?.currentIndex {
            switch index {
            case 0...1:
                settingsPageViewController?.forwardPage()

            case 2:
                UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
                dismiss(animated: true, completion: nil)

            default: break
            }

        }
        print("clicked")
        updateUI()
    }

    func updateUI() {
        if let index = settingsPageViewController?.currentIndex {
            switch index {
            case 0...1:
                nextBtn.setTitle("NEXT", for: .normal)

            case 2:
                nextBtn.setTitle("GET STARTED", for: .normal)

            default: break
            }

            pageControl.currentPage = index
        }
    }

    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        Label.text = label
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? SettingsPageViewController {
            settingsPageViewController = pageViewController
            settingsPageViewController?.settingsDelegate = self
        }
    }

}
