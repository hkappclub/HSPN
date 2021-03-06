//
//  PageViewController.swift
//  HSPN
//
//  Created by Kobi Greene on 2/14/17.
//  Copyright © 2017 Kobi Greene. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    weak var pageDelegate: PageViewControllerDelegate?
    
    fileprivate(set) lazy var orderedViewControllers: [UIViewController] = {
        // The view controllers will be shown in this order
        return [self.newPageViewController("Fall"),
                self.newPageViewController("Winter"),
                self.newPageViewController("Spring")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if let initialViewController = orderedViewControllers.first {
            scrollToViewController(initialViewController)
        }
        
        pageDelegate?.pageViewController(self, didUpdatePageCount: orderedViewControllers.count)
    }
    
    /**
     Scrolls to the next view controller.
     */
    func scrollToNextViewController() {
        if let visibleViewController = viewControllers?.first,
            let nextViewController = pageViewController(self,
                                                        viewControllerAfter: visibleViewController) {
            scrollToViewController(nextViewController)
        }
    }
    
    /**
     Scrolls to the view controller at the given index. Automatically calculates
     the direction.
     
     - parameter newIndex: the new index to scroll to
     */
    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
            let currentIndex = orderedViewControllers.index(of: firstViewController) {
            let direction: UIPageViewControllerNavigationDirection = newIndex >= currentIndex ? .forward : .reverse
            let nextViewController = orderedViewControllers[newIndex]
            scrollToViewController(nextViewController, direction: direction)
        }
    }
    
    fileprivate func newPageViewController(_ name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "\(name)ViewController")
    }
    
    /**
     Scrolls to the given 'viewController' page.
     
     - parameter viewController: the view controller to show.
     */
    fileprivate func scrollToViewController(_ viewController: UIViewController,
                                            direction: UIPageViewControllerNavigationDirection = .forward) {
        setViewControllers([viewController],
                           direction: direction,
                           animated: true,
                           completion: { (finished) -> Void in
                            // Setting the view controller programmatically does not fire
                            // any delegate methods, so we have to manually notify the
                            // 'pageDelegate' of the new index.
                            self.notifyPageDelegateOfNewIndex()
        })
    }
    
    /**
     Notifies '_pageDelegate' that the current page index was updated.
     */
    fileprivate func notifyPageDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.index(of: firstViewController) {
            pageDelegate?.pageViewController(self, didUpdatePageIndex: index)
        }
    }
    
}

// MARK: UIPageViewControllerDataSource

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
}

extension PageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        notifyPageDelegateOfNewIndex()
    }
    
}

protocol PageViewControllerDelegate: class {
    
    /**
     Called when the number of pages is updated.
     
     - parameter pageViewController: the PageViewController instance
     - parameter count: the total number of pages.
     */
    func pageViewController(_ pageViewController: PageViewController,
                            didUpdatePageCount count: Int)
    
    /**
     Called when the current index is updated.
     
     - parameter PageViewController: the PageViewController instance
     - parameter index: the index of the currently visible page.
     */
    func pageViewController(_ pageViewController: PageViewController,
                            didUpdatePageIndex index: Int)
    
}
