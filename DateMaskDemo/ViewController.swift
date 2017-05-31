//
//  ViewController.swift
//  DateMaskDemo
//
//  Created by Jenkins_New on 7/26/16.
//  Copyright © 2016 Daffodil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateInsert: UITextField!
    var dateMaker: MakeDate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib. 
        dateMaker = MakeDate(textField: self.dateInsert)
        self.dateInsert.delegate = self.dateMaker
        self.dateMaker.takeProperDateInput()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

