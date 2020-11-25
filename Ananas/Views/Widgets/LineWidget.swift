//
//  LineWidget.swift
//  Ananas
//
//  Created by Thierry Soulie on 24/11/2020.
//

import SwiftUI

struct LineWidget: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.gray)
    }
}

struct LineWidget_Previews: PreviewProvider {
    static var previews: some View {
        LineWidget()
    }
}
