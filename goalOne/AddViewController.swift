//
//  AddViewController.swift
//  goalOne
//
//  Created by Ben Swift on 12/23/15.
//  Copyright © 2015 Ben Swift. All rights reserved.
//

import UIKit

var times = ["8:00 AM", "10:00 AM", "12:00 PM", "2:00 PM", "4:00 PM"]

class AddViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //outlets
    
    @IBOutlet weak var cancelBtn: UIBarButtonItem!
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    @IBOutlet weak var bgLabel: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Add"
        self.navigationController?.navigationBar.barStyle = .Black
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255.0, green: 188/255.0, blue: 212/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 25)!]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        cancelBtn.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 18)!], forState: UIControlState.Normal)
        doneBtn.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 18)!], forState: UIControlState.Normal)
        bgLabel.clipsToBounds = true
        bgLabel.layer.cornerRadius = 10
        picker.dataSource = self
        picker.delegate = self
        picker.tintColor = UIColor.whiteColor()
        picker.selectRow(2, inComponent: 0, animated: true)
        
        
    }
    
    // picker view functions
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: times[row], attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
        return attributedString
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return times.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return times[row]
    }
    

    
//    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        myLabel.text = pickerData[row]
//    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //cancel btn
    
    @IBAction func cancelButton(sender: AnyObject) { 
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //function that checks if the input is the correct # of characters and adds reminder
    
    @IBAction func doneBtnAction(sender: AnyObject) {
        let charCount = field.text?.characters.count
        
        if charCount > 3 && charCount < 30 {
            mainArray.append(field.text!)
            self.dismissViewControllerAnimated(true, completion: nil)
        } else if charCount < 3 {
            let alert = UIAlertController(title: "Error", message: "Make sure you enter a longer reminder!", preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(alertAction)
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else if charCount > 30 {
            let alert = UIAlertController(title: "Error", message: "Try entering a shorter reminder!", preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(alertAction)
            self.presentViewController(alert, animated: true, completion: nil)
        
        }
    }
        
}


