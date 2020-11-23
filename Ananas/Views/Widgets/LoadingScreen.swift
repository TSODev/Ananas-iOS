//
//  LoadingScreen.swift
//  Ananas
//
//  Created by Thierry Soulie on 20/11/2020.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        ZStack{
            Image("pineapples-918921_1920")
                .resizable()
                .aspectRatio(contentMode: .fill)
            Rectangle()
                .frame(width: 500, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .cornerRadius(10)
            HStack {
                Text("CHARGEMENT...")
                    .font(.title2)

                    .foregroundColor(Color.gray)
                    .padding(40)
                ActivityIndicator(isAnimating: .constant(true), style: .large)
            }


        }
        

    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
