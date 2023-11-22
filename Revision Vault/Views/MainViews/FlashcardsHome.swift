//
//  FlashcardsHome.swift
//  Revision Vault
//
//  Created by Charlie Ward on 13/11/2023.
//

import SwiftUI

struct FlashcardsHome: View {
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        NavigationStack{
            List{
                FlashcardPageView(pages: modelData.flashcardFeatures.map {
                    FeatureCard(subject: $0)})
                .aspectRatio(3 / 2, contentMode: .fit)
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    FlashcardCategoryRow(categoryName: key, items: modelData.categories[key]!)}
            }
            .listStyle(.inset)
            .listRowInsets(EdgeInsets())
            .navigationTitle("Flashcards")
        }
    }
}

struct FlashcardsHome_Previews: PreviewProvider {
    static var previews: some View{
        FlashcardsHome()
            .environmentObject(ModelData())
    }
}
