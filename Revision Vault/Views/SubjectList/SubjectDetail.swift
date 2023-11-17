//
//  SubjectDetail.swift
//  Revision Vault
//
//  Created by Charlie Ward on 13/11/2023.
//

import SwiftUI

struct SubjectDetail: View {
    var subject: Subject
    var level: String
    var body: some View {
        VStack {
            Text("Qualification Level: \(level)")
            Text("Subject Category: \(subject.category.rawValue)")
        }
        .font(.subheadline)
        .foregroundStyle(.secondary)
            
            List{
                if subject.flashcards{
                    link(icon: "menucard.fill", label: "Flashcards", destination: CardsExamBoardSelector(subject: subject, level: level))
                }
                if subject.pastExamQs{
                    link(icon: "questionmark.circle.fill", label: "Past Exam Questions", destination: PastExamQsExamBoardSelector(subject: subject, level: level))
                }
                if subject.other{
                    link(icon: "ellipsis.circle.fill", label: "Other Resources", destination: HomeView())
                }
            }.navigationTitle("\(subject.name)")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    private func link<Destination: View>(icon: String, label: String, destination: Destination) -> some View {
        return NavigationLink(destination: destination) {
            HStack {
                Image(systemName: icon)
                Text(label)
            }
    }
}

struct SubjectDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View{
        SubjectRow(subject: modelData.subjects[0], level: "GCSE")
            .environmentObject(modelData)
    }
}
