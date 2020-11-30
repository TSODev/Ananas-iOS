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
            Image("ananas")
                .resizable()
                .aspectRatio(contentMode: .fill)
            Spacer()
            Rectangle()
                .frame(width: 400, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .cornerRadius(10)
                .opacity(0.7)
            HStack {
                Text("CHARGEMENT...")
                    .font(.title2)
                    .foregroundColor(Color.gray)
                    .padding(40)
                Spacer()
                ActivityIndicator(isAnimating: .constant(true), style: .large)
            }
            .padding()
            .frame(width: 350, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .onAppear(perform: {debugPrint("Appear : LoadingScreeen")})
        .onDisappear(perform: {debugPrint("Disappear : LoadingScreeen")})
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
        LoadingScreen()
            .previewDevice("iPhone X")
    }
}
