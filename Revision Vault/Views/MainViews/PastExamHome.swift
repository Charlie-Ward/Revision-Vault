//
//  PastExamHome.swift
//  Revision Vault
//
//  Created by Charlie Ward on 13/11/2023.
//

import SwiftUI

struct PastExamHome: View {
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        NavigationStack{
            List{
                FlashcardPageView(pages: modelData.pastExamQsFeatures.map {
                    FeatureCard(subject: $0)})
                .aspectRatio(3 / 2, contentMode: .fit)
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    PastExamQsCategoryRow(categoryName: key, items: modelData.categories[key]!)}
            }
            .listStyle(.inset)
            .listRowInsets(EdgeInsets())
            .navigationTitle("Past Exam Qs")
        }
    }
}

struct PastExamHome_Previews: PreviewProvider {
    static var previews: some View{
        PastExamHome()
            .environmentObject(ModelData())
    }
}
