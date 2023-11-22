//
//  PastExamQsCategoryRow.swift
//  Revision Vault
//
//  Created by Charlie Ward on 22/11/2023.
//


import SwiftUI

struct PastExamQsCategoryRow: View {
    var categoryName: String
    var items: [Subject]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0){
                    ForEach(items) { subject in
                        if subject.pastExamQs{
                            NavigationLink {
                                SubjectLevelChooser(subject: subject)
                            } label: {
                                CategoryItem(subject: subject)
                            }
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct PastExamQsCategoryRow_Previews: PreviewProvider {
    static var subjects = ModelData().subjects
    static var previews: some View {
        PastExamQsCategoryRow(
            categoryName: subjects[0].category.rawValue,
            items: Array(subjects.prefix(3))
        )
    }
}
