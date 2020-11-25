//
//  CapsuleText.swift
//  Ananas
//
//  Created by Thierry Soulie on 20/11/2020.
//

import SwiftUI

struct CapsuleText: View {

        var text: String
        

        var body: some View {

            Text(text)
                .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }

}

struct CapsuleText_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleText(text: "text")
    }
}
