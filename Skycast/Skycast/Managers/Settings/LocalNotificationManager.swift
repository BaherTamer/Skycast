//
//  LocalNotificationManager.swift
//  Skycast
//
//  Created by Baher Tamer on 14/09/2023.
//

import Foundation
import NotificationCenter

@MainActor final class LocalNotificationManager: ObservableObject {
    
    let notificationCenter = UNUserNotificationCenter.current()
    @Published var isAllowed = false
    
    func requestAuthorization() async throws {
        try await notificationCenter.requestAuthorization(options: [.sound, .badge, .alert])
        await getCurrentSettings()
    }
    
    func getCurrentSettings() async {
        let currentSettings = await notificationCenter.notificationSettings()
        isAllowed = (currentSettings.authorizationStatus == .authorized)
    }
    
    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                Task {
                    await UIApplication.shared.open(url)
                }
            }
        }
    }
    
    func scheduleLocalNotification(with date: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Today's Forecast"
        content.body = "Don't forget to check the weather today."
        
        var dateComponents = Calendar.current.dateComponents([.day, .hour, .minute], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "dailyReminder", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(request)
    }
}
