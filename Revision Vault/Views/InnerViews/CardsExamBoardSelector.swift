//
//  RevisionCardsMain.swift
//  Revision Vault
//
//  Created by Charlie Ward on 14/11/2023.
//

import SwiftUI

struct CardsExamBoardSelector: View {
    var subject: Subject
    var level: String
    var body: some View {
        VStack {
            Text("Qualification Level: \(level)")
            Text("Subject Category: \(subject.category.rawValue)")
            Text("Revision Cards")
        }
        .font(.subheadline)
        .foregroundStyle(.secondary)
        if level == "GCSE" {
            List{
                if subject.aqaGCSE {
                    link(label: "AQA", destination: HomeView())
                }
                if subject.edexcelGCSE {
                    link(label: "Edexcel", destination: HomeView())
                }
            }.navigationBarTitle(Text("\(subject.name)"), displayMode: .large)
        } else {
            List {
                if subject.aqaALEVEL {
                    link(label: "AQA", destination: HomeView())
                }
                if subject.edexcelALEVEL {
                    link(label: "Edexcel", destination: HomeView())
                }
            }
        }
        
    }
    
    private func link<Destination: View>(label: String, destination: Destination) -> some View {
        return NavigationLink(destination: destination) {
            HStack {
                Text(label)
            }
        }
    }
}

#Preview {
    CardsExamBoardSelector(subject: subjects[0], level: "GCSE")
}
