//
//  BoardingPageViewController.swift
//  arcweather-ios
//
//  Created by Analu Lisboa on 29/06/22.
//

import UIKit

protocol BoardingPageViewControllerDelegate {
    func didUpdatePageIndex(currentIndex: Int)
}

class BoardingPageViewController: UIPageViewController {

    // MARK: - Properties

    var pages = [UIViewController]()
    var boardingDelegate: BoardingPageViewControllerDelegate?
    var currentIndex = 0
    var initialPage = 0

    // MARK: - Actions

    override func viewDidLoad() {
        super.viewDidLoad()

//        currentIndex.self = initialPage

        dataSource = self
     //   delegate = self

        pages = [BoardingViewController.getInstance(index: 0),
                 BoardingViewController.getInstance(index: 1),
                 BoardingViewController.getInstance(index: 2)
                 ]

        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)

    }

    func forwardPage() {
        currentIndex += 1
        setViewControllers([pages[currentIndex]], direction: .forward, animated: true, completion: nil)
    }

}

extension BoardingPageViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        let index = (pages.firstIndex(of: viewController)!)

        if index > initialPage {
            return pages[index - 1]
        }

        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        let currentIndex = pages.firstIndex(of: viewController)!

        if currentIndex < 2 {
            return pages[currentIndex + 1]
        }

        return nil
    }

}

// extension BoardingPageViewController: UIPageViewControllerDelegate {
//    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        if completed {
//            if let boardingViewController = pageViewController.viewControllers?.first as? BoardingViewController {
//                currentIndex = boardingViewController.boardingIndex
//                print("animating index: \(boardingViewController.boardingIndex)")
//                print("current index: \(currentIndex)")
//                boardingDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
//            }
//        }
//    }
//
// }
