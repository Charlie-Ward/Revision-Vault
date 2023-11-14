//
//  SubjectList.swift
//  Revision Vault
//
//  Created by Charlie Ward on 13/11/2023.
//

import SwiftUI

struct SubjectList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List(modelData.subjects) { subject in
                if subject.gcse {
                    NavigationLink {
                        SubjectDetail(subject: subject, level: "GCSE")
                    } label: {
                        SubjectRow(subject: subject, level: "GCSE")
                    }
                }
                if subject.alevel {
                    NavigationLink {
                        SubjectDetail(subject: subject, level: "A-Level")
                    } label: {
                        SubjectRow(subject: subject, level: "A-Level")
                    }
                }
            }
            .navigationTitle("All Subjects")
        }
    }
}


struct SubjectList_Previews: PreviewProvider {
    static var previews: some View {
        SubjectList()
            .environmentObject(ModelData())
    }
}
