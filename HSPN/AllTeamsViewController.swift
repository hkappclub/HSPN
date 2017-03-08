//
//  AllTeamsViewController.swift
//  HSPN
//
//  Created by Kobi Greene on 12/14/16.
//  Copyright © 2016 Kobi Greene. All rights reserved.
//

import UIKit

class AllTeamsViewController: UIViewController {
    
    var boyteams = [String]()
    var girlteams = [String]()
    var coedteams = [String]()

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var PageViewController: PageViewController? {
        didSet {
            PageViewController?.pageDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        boyteams = ["Boys Varsity Soccer", "Boys Water Polo", "Varsity Football"]
        girlteams = ["Girls Varsity Soccer", "Girls Varsity Volleyball", "Girls JV Volleyball"]
        coedteams = ["Blah", "Blah Blah"]
        pageControl.addTarget(self, action: #selector(AllTeamsViewController.didChangePageControlValue), for: .valueChanged)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pageViewController = segue.destination as? PageViewController {
            self.PageViewController = pageViewController
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func didChangePageControlValue() {
        PageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
    
    
}

extension AllTeamsViewController: PageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: PageViewController,
                            didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func pageViewController(_ pageViewController: PageViewController,
                            didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}

