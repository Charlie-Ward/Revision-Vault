//
//  PastExamQsExamBoardSelector.swift
//  Revision Vault
//
//  Created by Charlie Ward on 14/11/2023.
//

import SwiftUI

struct PastExamQsExamBoardSelector: View {
    var subject: Subject
    var level: String
    var body: some View {
        VStack {
            Text("Qualification Level: \(level)")
            Text("Subject Category: \(subject.category.rawValue)")
            Text("Past Exam Questions")
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
            }.navigationTitle("\(subject.name)")
                .navigationBarTitleDisplayMode(.large)
        } else if level == "A-Level" {
            List {
                if subject.aqaALEVEL {
                    link(label: "AQA", destination: HomeView())
                }
                if subject.edexcelALEVEL {
                    link(label: "Edexcel", destination: HomeView())
                }
            }.navigationTitle("\(subject.name)")
                .navigationBarTitleDisplayMode(.large)
        } else{
            Text("Level Fail")
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

struct PastExamQsExamBoardSelector_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        PastExamQsExamBoardSelector(subject: modelData.subjects[0], level: "GCSE")
            .environmentObject(modelData)
    }
}
