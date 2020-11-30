//
//  NobodyWidget.swift
//  Ananas
//
//  Created by Thierry Soulie on 27/11/2020.
//

import SwiftUI

struct NobodyWidget: View {
    var body: some View {
        HStack {
        Image(systemName: "nosign")
            .font(.system(size: 40, weight: .regular))
            .foregroundColor(.red)
        Text("Aucun collaborateur trouvé")
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .font(.title2)
        Spacer()
        }
        .padding()
    }
}

struct NobodyWidget_Previews: PreviewProvider {
    static var previews: some View {
        NobodyWidget()
    }
}
