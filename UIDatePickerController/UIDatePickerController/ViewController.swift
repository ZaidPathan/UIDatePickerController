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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func IBActionPickDate(_ sender: UIButton) {
        UIDatePickerController.pickDate(title: "Choose Date", pickTitle: "Select", cancelTitle: "Cancel", delegate: self)
    }
    
    func didPickDate(data: Date?) {
        IBlblDate.text = data?.description
        print(data!)
    }
    
    func didCancelPickingDate() {
        
    }
}

