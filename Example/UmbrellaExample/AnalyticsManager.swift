//
//  AnalyticsManager.swift
//  UmbrellaExample
//
//  Created by Jeffrey Berthiaume on 5/7/24.
//

import Foundation
import Umbrella

class AnalyticsManager {
    static let shared = AnalyticsManager()
    let analytics = Analytics<MyAppEvent>()
    
    func setupAnalytics {
        analytics.register(provider: FirebaseProvider())
    }
    
}
