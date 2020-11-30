//
//  NoEvent.swift
//  Ananas
//
//  Created by Thierry Soulie on 30/11/2020.
//

import SwiftUI

struct NoEvent: View {
    var body: some View {
        HStack {
            VStack {
                Text("Chargement des données")
                ActivityIndicator(isAnimating: .constant(true), style: .medium)
                Text("Veuillez patienter")
            }
                .padding(10)

        }

    }
}

struct NoEvent_Previews: PreviewProvider {
    static var previews: some View {
        NoEvent()
    }
}
