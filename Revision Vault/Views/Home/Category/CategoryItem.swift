//
//  CategoryItem.swift
//  Revision Vault
//
//  Created by Charlie Ward on 16/11/2023.
//

import SwiftUI

struct CategoryItem: View {
    var subject: Subject
    
    var body: some View {
        VStack(alignment: .leading) {
            subject.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(subject.name)
                .foregroundStyle(.primary)
                .font(.caption)
            if subject.gcse && subject.alevel {
                Text("GCSE & A-Level")
                    .font(.caption2)
            } else if subject.gcse {
                Text("GCSE")
                    .font(.caption2)
            } else if subject.alevel {
                Text("A-Level")
                    .font(.caption2)
            }
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(subject: ModelData().subjects[0])
    }
}
