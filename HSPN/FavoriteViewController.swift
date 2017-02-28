//
//  FavoriteViewController.swift
//  HSPN
//
//  Created by Kobi Greene on 12/14/16.
//  Copyright © 2016 Kobi Greene. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var recentScores: UITableView!
    @IBOutlet weak var upcomingGames: UITableView!
    
    var recScores = [String]()
    var upGames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recScores = ["(Sep 9, 2016) Boys Varsity Soccer vs Berkshire. 5 - 2 Win"]
        upGames = ["(Oct 2, 2016) Boys Varsity Soccer vs Avon"]
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == recentScores {
            return recScores.count
        }else if tableView == upcomingGames{
            return upGames.count
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == recentScores {
            let cell: UITableViewCell = self.recentScores.dequeueReusableCell(withIdentifier: "cell1")!
            cell.textLabel?.text = recScores[indexPath.row]

            return cell
        }else if tableView == upcomingGames{
            let cell: UITableViewCell = self.upcomingGames.dequeueReusableCell(withIdentifier: "cell2")!
            cell.textLabel?.text = upGames[indexPath.row]
            
            return cell
        }else {
            let cell: UITableViewCell = self.recentScores.dequeueReusableCell(withIdentifier: "cell1")!

            return cell
        }
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
