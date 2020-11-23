//
//  DatafileHRAListView.swift
//  Ananas
//
//  Created by Thierry Soulie on 21/11/2020.
//

import SwiftUI

struct DatafileHRAListView: View {
    var datafile: Datafile
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
                DateWidget(date: datafile.loadDate, format: "dd MMMM YYYY")
                    .padding()
                Spacer()
            }
            .padding(.horizontal,20)
            HStack {
                Text(datafile.filename)
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

struct DatafileHRAListView_Previews: PreviewProvider {
    static var previews: some View {
        DatafileHRAListView(datafile: sampleDatafile1)
    }
}
