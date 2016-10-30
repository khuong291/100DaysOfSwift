//
//  ReminderDetails.swift
//  ManageMyReminders
//
//  Created by Malek T. on 11/20/15.
//  Copyright © 2015 Medigarage Studios LTD. All rights reserved.
//

import UIKit
import EventKit

class ReminderDetails: UIViewController {

    @IBOutlet var dateTextField: UITextField!
    @IBOutlet weak var reminderTextView: UITextView!
    
    var datePicker: UIDatePicker!
    var reminder: EKReminder!
    var eventStore: EKEventStore!
    
    @IBAction func saveReminder(_ sender: AnyObject) {
        reminder.title = reminderTextView.text
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let dueDateComponents = appDelegate.dateComponentFromDate(date: datePicker.date)
        reminder.dueDateComponents = dueDateComponents
        reminder.calendar = eventStore.defaultCalendarForNewReminders()
        do {
            try self.eventStore.save(reminder, commit: true)
            _ = navigationController?.popViewController(animated: true)
        } catch {
            print("Error creating and saving new reminder : \(error)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reminderTextView.text = reminder.title
        datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(ReminderDetails.addDate), for: UIControlEvents.valueChanged)
        datePicker.datePickerMode = UIDatePickerMode.dateAndTime
        dateTextField.inputView = datePicker
        reminderTextView.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addDate(){
        dateTextField.text = datePicker.date.description
    }
}
