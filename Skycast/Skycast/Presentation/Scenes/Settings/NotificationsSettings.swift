//
//  NotificationsSettings.swift
//  Skycast
//
//  Created by Baher Tamer on 14/09/2023.
//

import SwiftUI

struct NotificationsSettings: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var localNotificationManager: LocalNotificationManager
    
    @State private var alertTime: Date = .now
    
    var body: some View {
        Form {
            Section {
                if localNotificationManager.isAllowed {
                    timePicker
                } else {
                    appSettingsButton
                }
            }
        }
        .navigationTitle(String(localized: "notifications"))
        .navigationBarTitleDisplayMode(.inline)
        .task {
            try? await localNotificationManager.requestAuthorization()
        }
        .onDisappear {
            localNotificationManager.scheduleLocalNotification(with: alertTime)
        }
    }
    
    private var timePicker: some View {
        DatePicker(String(localized: "dailyReminder"), selection: $alertTime, displayedComponents: .hourAndMinute)
    }
    
    private var appSettingsButton: some View {
        Button {
            localNotificationManager.openSettings()
            dismiss()
        } label: {
            HStack {
                Text(String(localized: "allowNotifications"))
                    .font(.headline)
                Spacer()
                Image(systemName: "arrow.up.forward")
                    .tint(Color(UIColor.systemGray2))
            }
        }

    }
}

struct NotificationsSettings_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NotificationsSettings()
                .environmentObject(LocalNotificationManager())
        }
    }
}
