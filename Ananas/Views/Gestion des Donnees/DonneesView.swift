//
//  DonneesView.swift
//  Ananas
//
//  Created by Thierry Soulie on 21/11/2020.
//

import SwiftUI

struct DonneesView: View {
    
    var donnees : [Datafile]
    var metadata: [Metadata]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack{
                    NavigationLink(
                        destination: MetadataView(metadata: metadata),
                        label: {
                            MetadataTileView(
                                filename: metadata.filter{
                                $0.group == "LN" && $0.key == "fileName"
                            }[0],
                            lastloaded: metadata.filter{
                                $0.group == "LN" && $0.key == "lastLoaded"
                            }[0])
                        })
                        .buttonStyle(PlainButtonStyle())
                    Spacer()
                }
                ForEach(donnees) {df in
                HStack {

                    NavigationLink(
                        destination: DatafileHRAListView(datafile: df),
                        label: {
                            DatafileTileView(datafile: df)
                        })
                        .buttonStyle(PlainButtonStyle())
                    Spacer()
                }
                }

            }
            .frame(minWidth:250)
            .navigationTitle("Données ")
        }
    }
}

struct DonneesView_Previews: PreviewProvider {
    static var previews: some View {
        DonneesView(donnees: [sampleDatafile1], metadata: [sampleMetada1, sampleMetada2, sampleMetada3])
    }
}
