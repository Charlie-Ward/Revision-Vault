//
//  SubjectLevelChooser.swift
//  Revision Vault
//
//  Created by Charlie Ward on 17/11/2023.
//

import SwiftUI

struct SubjectLevelChooser: View {
    var subject: Subject
    
    var body: some View {
        VStack {
            Text("Subject Category: \(subject.category.rawValue)")
        }
        .font(.subheadline)
        .foregroundStyle(.secondary)
        List {
            if subject.gcse {
                link(label: "GCSE", destination: SubjectDetail(subject: subject, level: "GCSE"))
            }
            if subject.alevel {
                link(label: "A-Level", destination: SubjectDetail(subject: subject, level: "A-Level"))
            }
        }.navigationTitle("\(subject.name)")
            .navigationBarTitleDisplayMode(.large)
    }
    
    private func link<Destination: View>(label: String, destination: Destination) -> some View {
        return NavigationLink(destination: destination) {
            HStack {
                Text(label)
            }
        }
    }
}

struct SubjectLevelChooser_Previews: PreviewProvider {
    static var subjects = ModelData().subjects
    
    static var previews: some View{
        SubjectLevelChooser(subject: subjects[0])
    }
}
