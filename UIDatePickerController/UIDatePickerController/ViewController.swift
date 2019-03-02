//
//  ViewController.swift
//  UIDatePickerController
//
//  Created by Zaid Pathan on 24/10/16.
//  Copyright © 2016 Zaid Pathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIDatePickerControllerDelegate {
    
    @IBOutlet weak var IBlblDate: UILabel!
    
    @IBAction func IBActionPickDate(_ sender: UIButton) {
        UIDatePickerController.pickDate(title: "Choose Date", pickTitle: "Select", cancelTitle: "Cancel", delegate: self)
    }
    
    func didPickDate(data: Date?) {
        let dateForrmatter = DateFormatter()
        dateForrmatter.dateFormat = "dd-MM-yyyy"
        if let date = data {
            IBlblDate.text = dateForrmatter.string(from: date)
        }
    }
    
    func didCancelPickingDate() {
        
    }
}

