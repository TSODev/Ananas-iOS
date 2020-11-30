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

                HStack{
                    Image(systemName: "filemenu.and.cursorarrow")
                        .font(.system(size: 40, weight: .regular))
                        .foregroundColor(.purple)
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
                    Text("\(datafile.nbrecords) enr.")
                        .font(.callout)
                }
                .padding()
            }
        }

    }
    
    }


struct DatafileTileView_Previews: PreviewProvider {
    static var previews: some View {
        DatafileTileView(datafile: sampleDatafile1)
            .colorScheme(.light)
        DatafileTileView(datafile: sampleDatafile1)
            .colorScheme(.dark)
    }
}
