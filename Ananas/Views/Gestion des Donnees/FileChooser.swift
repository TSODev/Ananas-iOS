//
//  FileChooser.swift
//  Ananas
//
//  Created by Thierry Soulie on 22/11/2020.
//

import SwiftUI

struct FileChooser: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    var body: some View {

        VStack{
            Spacer()
            Text("Travail en cours...")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()

    //            .onTapGesture {
    //                let str = "Test Message"
    //                let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")
    //
    //                do {
    //                    try str.write(to: url, atomically: true, encoding: .utf8)
    //                    let input = try String(contentsOf: url)
    //                    print(input)
    //                } catch {
    //                    print(error.localizedDescription)
    //                }
    //            }
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Retour")
                    .font(.title2)
            }
            .buttonStyle(DefaultButtonStyle())
            Spacer()
        }
    }
    
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    
    private func load(fileName: String) -> UIImage? {
        let fileURL = documentsUrl.appendingPathComponent(fileName)
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        }
        return nil
    }
}

struct FileChooser_Previews: PreviewProvider {
    static var previews: some View {
        FileChooser()
    }
}
