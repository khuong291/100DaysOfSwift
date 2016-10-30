//
//  NewReminder.swift
//  ManageMyReminders
//
//  Created by Malek T. on 11/20/15.
//  Copyright © 2015 Medigarage Studios LTD. All rights reserved.
//

import UIKit
import EventKit

class NewReminder: UIViewController {

    @IBOutlet weak var reminderTextView: UITextView!
    @IBOutlet var dateTextField: UITextField!
    
    var eventStore: EKEventStore!
    var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(NewReminder.addDate), for: UIControlEvents.valueChanged)
        datePicker.datePickerMode = UIDatePickerMode.dateAndTime
        dateTextField.inputView = datePicker
        reminderTextView.becomeFirstResponder()
    }
    
    @IBAction func saveNewReminder(_ sender: AnyObject) {
        let reminder = EKReminder(eventStore: eventStore)
        reminder.title = reminderTextView.text
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let dueDateComponents = appDelegate.dateComponentFromDate(date: datePicker.date)
        reminder.dueDateComponents = dueDateComponents
        reminder.calendar = self.eventStore.defaultCalendarForNewReminders()

        do {
            try self.eventStore.save(reminder, commit: true)
            dismiss(animated: true, completion: nil)
        } catch {
            print("Error creating and saving new reminder : \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func dismiss(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    func addDate() {
        self.dateTextField.text = self.datePicker.date.description
    }
}
