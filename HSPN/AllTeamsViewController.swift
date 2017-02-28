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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        boyteams = ["Boys Varsity Soccer", "Boys Water Polo", "Varsity Football"]
        girlteams = ["Girls Varsity Soccer", "Girls Varsity Volleyball", "Girls JV Volleyball"]
        coedteams = ["Blah", "Blah Blah"]
//        boysTableView.delegate = self
//        girlsTableView.delegate = self
//        coedTableView.delegate = self
        pageControl.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
