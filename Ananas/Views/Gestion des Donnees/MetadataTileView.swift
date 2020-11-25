//
//  MetadataTileView.swift
//  Ananas
//
//  Created by Thierry Soulie on 21/11/2020.
//

import SwiftUI

struct MetadataTileView: View {
    
    var filename: Metadata
    var lastloaded: Metadata
    
    var body: some View {
        
        HStack {
            VStack(spacing: 0) {
                HStack{
                    Image(systemName: "filemenu.and.cursorarrow")
                        .font(.system(size: 40, weight: .regular))
                        .foregroundColor(.blue)
                    Text("Fichier LN")
                        .font(.largeTitle)
                    Spacer()

                    }
                    .padding(.horizontal)
                    .padding(.vertical,20)
                HStack{
                    Text("\(filename.value)")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                .padding(.horizontal)
                HStack{
                    Text("(\(lastloaded.value))")
                        .font(.callout)
                    Spacer()
                }
                .padding()

            }
        }
            .padding()
    }
    
    }

struct MetadataTileView_Previews: PreviewProvider {
    static var previews: some View {
        MetadataTileView(filename: sampleMetada1,lastloaded: sampleMetada2)
    }
}
