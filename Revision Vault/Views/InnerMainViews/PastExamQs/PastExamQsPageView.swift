//
//  PastExamQsPageView.swift
//  Revision Vault
//
//  Created by Charlie Ward on 22/11/2023.
//

import SwiftUI

struct PastExamQsPageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 10))
                .padding(.trailing)
        }
    }
}

struct PastExamQsPageView_Previews: PreviewProvider {
    static var previews: some View {
        PastExamQsPageView(pages: ModelData().pastExamQsFeatures.map {
            FeatureCard(subject: $0)})
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}
