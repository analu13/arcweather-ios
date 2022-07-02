//
//  SettingsPageViewController.swift
//  arcweather-ios
//
//  Created by Analu Lisboa on 01/07/22.
//

import UIKit

protocol SettingsPageViewControlleDelegate: AnyObject {
    func didUpdatePageIndex(currentIndex: Int)
}

class SettingsPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    weak var settingsDelegate: SettingsPageViewControlleDelegate?
    var label = ["CREATE YOUR OWN CAFE GUIDE", "SHOW YOU THE LOCATION", "DISCOVER GREAT CAFES"]
    var currentIndex = 0

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! SettingsContentViewController).index
        index -= 1

        return contentViewController(at: index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! SettingsContentViewController).index
        index += 1

        return contentViewController(at: index)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self

        // Create the first walkthrough screen
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    func contentViewController(at index: Int) -> SettingsContentViewController? {
        if index < 0 || index >= label.count {
            return nil
        }

        // Create a new view controller and pass suitable data
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "SettingsContentViewController") as? SettingsContentViewController {
            pageContentViewController.label = label[index]
            pageContentViewController.index = index

            return pageContentViewController
        }

        return nil
    }

    func forwardPage() {
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? SettingsContentViewController {
                currentIndex = contentViewController.index

                settingsDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
    }

}
