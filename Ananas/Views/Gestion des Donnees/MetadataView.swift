//
//  MetadataView.swift
//  Ananas
//
//  Created by Thierry Soulie on 21/11/2020.
//

import SwiftUI

struct MetadataView: View {
    var metadata: [Metadata]
    @State var showFileChooser = false
    var body: some View {
        VStack {
            HStack {
                Image("icon-excel-20.jpg")
            }
            .padding()
            Rectangle()
                .frame(width: 400, height: 5, alignment:.center)
                .foregroundColor(.green)
            HStack {
                FormLabelView(title: "Chargement du :", iconSystemName: "calendar", color: .yellow)
                TextMetadata(metadata: metadata, group: "LN", key: "lastLoaded")
                    .padding()
                Spacer()
            }
            .padding(.horizontal,20)
            HStack {
                TextMetadata(metadata: metadata, group: "LN", key: "fileName")
                    .font(.title)
                    .padding(.vertical,15)
                Spacer()
            }
            .padding(.horizontal, 30)
            Button(action: {
                showFileChooser = true
            }) {
                Text("Remplacer le fichier")
                    .font(.title2)
                    .padding(.top,50)
            }
            .buttonStyle(BorderlessButtonStyle())
            
        }
        .sheet(isPresented: $showFileChooser) {
            FileChooser()
            Spacer()

        }

    }

    
}

struct MetadataView_Previews: PreviewProvider {
    static var previews: some View {
        MetadataView(metadata: sampleMetadataList)
    }
}
