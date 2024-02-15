//
//  ContentView.swift
//  WordQuizDaily
//
//  Created by 정종원 on 1/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {

            QuizView()
                .tabItem {
                    Label("Quiz", systemImage: "questionmark.circle")
                }
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.circle.fill")
                }
            
            NotificationView()
                .tabItem {
                    Label("Notification", systemImage: "bell.circle.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
