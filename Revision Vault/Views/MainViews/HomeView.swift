//
//  HomeView.swift
//  Revision Vault
//
//  Created by Charlie Ward on 13/11/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        NavigationStack{
            List{
                PageView(pages: modelData.features.map {
                    FeatureCard(subject: $0)})
                .aspectRatio(3 / 2, contentMode: .fit)
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)}
            }
            .listStyle(.inset)
            .listRowInsets(EdgeInsets())
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View{
        HomeView()
            .environmentObject(ModelData())
    }
}
