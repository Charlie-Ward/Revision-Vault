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
                link(icon: "menucard.fill", label: "Revision Cards", destination: HomeView())
                link(icon: "questionmark.circle.fill", label: "Past Exam Questions", destination: HomeView())
                link(icon: "ellipsis.circle.fill", label: "Other Resources", destination: HomeView())
            }.navigationBarTitle(Text("\(subject.name)"), displayMode: .large)
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

#Preview {
    SubjectDetail(subject: subjects[0], level: "GCSE")
}
