//
//  ViewController.swift
//  ViewDayFinder
//
//  Created by Эдуард on 9/22/19.
//  Copyright © 2019 Eduard Ivash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findWekkDay() {
        
        let calendar = Calendar.current
        
        var dateComponents = DateComponents()
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else {return}
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        if day == "", month == "", year == "" {
            return
        }
        
        guard let date = calendar.date(from: dateComponents) else {return}
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_EN")
        dateFormatter.dateFormat = "EEEE"
        
        let weekDay = dateFormatter.string(from: date)
        let weekdayCapitalized = weekDay.capitalized
        
        resultLabel.text = weekdayCapitalized
   
    }
    
    override func viewDidLoad() {
        cornerRadius()
    }
                
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

// MARK: Extensions for ViewController
extension ViewController {
    
    func cornerRadius() {
        dateTF.layer.cornerRadius = dateTF.bounds.height / 2
        monthTF.layer.cornerRadius = 4
        yearTF.layer.cornerRadius = 2
        resultLabel.layer.cornerRadius = 50
    }
}
