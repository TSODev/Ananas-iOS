//
//  DatafileTileView.swift
//  Ananas
//
//  Created by Thierry Soulie on 21/11/2020.
//

import SwiftUI

struct DatafileTileView: View {
    
    var datafile: Datafile
    
    var body: some View {
        
        HStack {
            VStack(spacing: 0) {
                Rectangle()
                    .frame( height: 20)
                    .foregroundColor(.purple)
                HStack{
                    Text("Fichier HRA")
                        .font(.largeTitle)
                    Spacer()

                    }
                    .padding(.horizontal)
                    .padding(.vertical,20)
                HStack{
                    Text("\(datafile.filename)")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                .padding(.horizontal)
                HStack{
                    DateWidget(date: datafile.loadDate, format: "dd MMMM YYYY HH:MM")
                        .font(.callout)
                    Spacer()
                }
                .padding()

            }
            .background(Color.white)
        }
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
    
    }


struct DatafileTileView_Previews: PreviewProvider {
    static var previews: some View {
        DatafileTileView(datafile: sampleDatafile1)
    }
}
