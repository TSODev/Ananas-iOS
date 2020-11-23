//
//  AnomalieUpdateFormViewCompact.swift
//  Ananas
//
//  Created by Thierry Soulie on 22/11/2020.
//

import SwiftUI

struct AnomalieUpdateFormViewCompact: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    var anomalie: Anomalie
    @State var selectedEtat:Etat = Etat.ouverte
    @State var commentaire = ""
    
    enum Etat: String, CaseIterable, Identifiable {
        case ouverte
        case encours
        case corrigee

        var id: String { self.rawValue }
    }
    
    var body: some View {
        HStack {
            //Form {
                HStack{
                    VStack{
                        HStack {
                            FormLabelView(title: "Etat", iconSystemName: "capsule.fill", color: .purple)
                            Spacer()
                        }
                            HStack{

                                Picker("Select: \(selectedEtat.rawValue)", selection: $selectedEtat) {
                                    Text("OUVERTE").tag(Etat.ouverte)
                                    Text("EN COURS").tag(Etat.encours)
                                    Text("CORRIGEE").tag(Etat.corrigee)
                                }
                                .onAppear(perform: {
                                    if (anomalie.etat == 1) { selectedEtat = Etat.ouverte}
                                    if (anomalie.etat == 2) { selectedEtat = Etat.encours}
                                    if (anomalie.etat == 3) { selectedEtat = Etat.corrigee}
                                })
                                .pickerStyle(SegmentedPickerStyle())

                            }

                        .padding(.bottom,5)
                        HStack {
                            FormLabelView(title: "Commentaire", iconSystemName: "pencil", color: .yellow)
                            Spacer()
                        }
                                HStack {

                                    TextEditor(text: $commentaire)
                                        .foregroundColor(Color.gray)
                                        .padding(.vertical)
                                        .font(.body)
                                        .border(Color.gray, width: 1)
                                        .onAppear(perform: {
                                                commentaire = anomalie.commentaire
                                            })
                                }
                                .padding(.vertical,5)
                        HStack{
                            Button(action: {
                                var updatedEtat = 0
                                switch (selectedEtat){
                                case Etat.ouverte: updatedEtat = 1
                                case Etat.encours: updatedEtat = 2
                                case Etat.corrigee: updatedEtat = 3
                                }

                                DataController.shared.sendUpdateAnomalieRequest(id: anomalie.anomalie_id, etat: updatedEtat, commentaire: commentaire)
                                anomalie.etat = updatedEtat
                                anomalie.commentaire = commentaire
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                Text("Enregistre")
                                    .font(.title3)
                            }
                            .buttonStyle(DefaultButtonStyle())
                        }
                    }
                    .padding(.horizontal)

//                    .padding(.top, 80)
                }
            }
            .frame(width: 350, height: 250.0)
//        }
//        .padding(2)

        
    }
}

struct AnomalieUpdateFormViewCompact_Previews: PreviewProvider {
    static var previews: some View {
        AnomalieUpdateFormViewCompact(anomalie: sampleAnomalie1)
    }
}
