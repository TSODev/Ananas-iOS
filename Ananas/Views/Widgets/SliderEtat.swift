//
//  SliderEtat.swift
//  Ananas
//
//  Created by Thierry Soulie on 20/11/2020.
//

import SwiftUI

struct SliderEtat: View {
    @State var sliderValue: Double = 0
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "minus")
                Slider(value: $sliderValue, in: 1...3, step: 1)
                Image(systemName: "plus")

            }.padding()
            Text("Etat: \(sliderValue, specifier: "%.2f")")
        }

    }
}

struct SliderEtat_Previews: PreviewProvider {
    static var previews: some View {
        SliderEtat()
    }
}
