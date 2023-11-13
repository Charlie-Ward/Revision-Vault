//
//  ContentView.swift
//  Revision Vault
//
//  Created by Charlie Ward on 13/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case allSubjects
        case revisionCards
        case pastExamQuestions
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(Tab.home)
            RevisionCardsHome()
                .tabItem {
                    Label("Revision Cards", systemImage: "menucard.fill")
                }
            PastExamHome()
                .tabItem {
                    Label("Past Exam Qs", systemImage: "questionmark.circle.fill")
                }
            SubjectList()
                .tabItem {
                    Label("All Subjects", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    ContentView()
}
