//
//  DateWidget.swift
//  Ananas
//
//  Created by Thierry Soulie on 22/11/2020.
//

import SwiftUI
import SwiftDate

struct DateWidget: View {
    var date: Date
    var format: String
    var body: some View {
        Text(date.toFormat(format, locale: Locales.french))
            .frame(width: 150, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct DateWidget_Previews: PreviewProvider {
    static var previews: some View {
        DateWidget(date: Date(), format: "dd MMMM YYYY")
    }
}
