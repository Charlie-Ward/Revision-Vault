//
//  FeatureCard.swift
//  Revision Vault
//
//  Created by Charlie Ward on 14/11/2023.
//

import SwiftUI

struct FeatureCard: View {
    var subject: Subject
    
    var body: some View {
        subject.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay{
                TextOverlay(subject: subject)
            }
    }
}
                    
struct TextOverlay: View {
    var subject: Subject
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6),
                              .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View{
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(subject.name)
                    .font(.title)
                    .bold()
                if subject.gcse && subject.alevel{
                    Text("GCSE & A-Level")
                } else if subject.gcse {
                    Text("GCSE")
                } else if subject.alevel {
                    Text("A-Level")
                }
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(subject: ModelData().features[0])
    }
}
