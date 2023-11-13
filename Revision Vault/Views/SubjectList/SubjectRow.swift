//
//  allSubjects.swift
//  Revision Vault
//
//  Created by Charlie Ward on 13/11/2023.
//

import SwiftUI
struct SubjectRow: View {
    var subject: Subject
    var level: String

    var body: some View {
        HStack {
//            landmark.image
//                .resizable()
//                .frame(width: 50, height: 50)
            VStack {
                Text("\(subject.name) - \(level)")
            }

            Spacer()
        }
    }
}
        
        
//        VStack {
//            Image
//            Text(subject.name)
//            Text(subject.category.rawValue)
//            if subject.gcse{
//                Text("GCSE: True")
//            } else{
//                Text("GCSE: False")
//            }
//            
//            if subject.alevel{
//                Text("A-Level: True")
//            } else{
//                Text("A-Level: False")
//            }
//        }


struct SubjectRow_Previews: PreviewProvider {    
    static var previews: some View{
        SubjectRow(subject: subjects[0], level: "GCSE")
    }
}
