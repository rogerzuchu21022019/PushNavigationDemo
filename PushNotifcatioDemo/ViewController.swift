//
//  ViewController.swift
//  PushNotifcatioDemo
//
//  Created by Vu Thanh Nam on 16/05/2022.
//

import UIKit
import UserNotifications

class ViewController: UIViewController,UNUserNotificationCenterDelegate {
  
    let centerNotification = UNUserNotificationCenter.current()
    override func viewDidLoad() {
        super.viewDidLoad()
        centerNotification.delegate = self
        initNotification()
    }
    
    func initNotification(){
        //create permission
        centerNotification.requestAuthorization(options: [.alert,.badge,.sound]){
            (success,error) in
        }
        //create content
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.body = "This is first demo Notification"
        content.categoryIdentifier = "My category identifier"
        content.sound = UNNotificationSound.defaultRingtone
        content.badge = 5
        let identifier = "My Identifier"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        centerNotification.add(request){
            (error1) in
            print("\(error1?.localizedDescription)")
        }
        let see = UNNotificationAction.init(identifier: "See", title: "See", options: .foreground)
        let reply = UNNotificationAction.init(identifier: "Reply", title: "Reply", options: .destructive)
        let category = UNNotificationCategory.init(identifier: content.categoryIdentifier, actions: [see, reply], intentIdentifiers: [], options: [])
        centerNotification.setNotificationCategories([category])
        
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.badge,.sound])
    }


    
}

