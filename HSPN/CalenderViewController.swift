//
//  CalenderViewController.swift
//  HSPN
//
//  Created by Kobi Greene on 12/14/16.
//  Copyright © 2016 Kobi Greene. All rights reserved.
//

import UIKit

class CalenderViewController: UIViewController {

    @IBOutlet weak var game1Label: UILabel!
    @IBOutlet weak var game2Label: UILabel!
    @IBOutlet weak var game3Label: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datePicker.addTarget(self, action: #selector(CalenderViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }

    func datePickerValueChanged (datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        let dateValue = dateFormatter.string(from: datePicker.date)
        print(dateValue)
        game1Label.text = dateValue
        if(dateValue == "Oct 1, 2016")
        {
            game1Label.text = "Girls Varsity Soccer vs NMH"
            game2Label.text = "Boys Water Polo @ Choate"
            game3Label.text = "Varsity Football @ Kent"
        }
        else if(dateValue == "Oct 2, 2016")
        {
          game1Label.text = "Boys Varsity Soccer @ Taft"
          game2Label.text = "Girls 3rd Soccer @ Taft"
          game3Label.text = "Girls Field Hockey vs Loomis"
        }
        else if(dateValue == "Oct 3, 2016")
        {
            game1Label.text = "Varsity Football vs Salisbury"
            game2Label.text = "Boys JV Soccer vs Avon"
            game3Label.text = "Boys 3rds Soccer vs Avon"
        }
        else if(dateValue == "Oct 4, 2016")
        {
            game1Label.text = "Girls JV Field Hockey @ Kent"
            game2Label.text = "Boys XC @ Taft"
            game3Label.text = "Girls XC @ Taft"
        }
        
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
