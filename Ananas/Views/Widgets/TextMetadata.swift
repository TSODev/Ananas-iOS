//
//  TextMetadata.swift
//  Ananas
//
//  Created by Thierry Soulie on 22/11/2020.
//

import SwiftUI

struct TextMetadata: View {
    var metadata: [Metadata]
    var group: String
    var key: String

    @State var value: String = ""
    

    var body: some View {
        Text(value)
            .onAppear(perform: {
                value = metadata.filter({
                        $0.group == group && $0.key == key
                    })[0].value
            })
        }
}

struct TextMetadata_Previews: PreviewProvider {
    static var previews: some View {
        TextMetadata(metadata: sampleMetadataList, group: "LN", key: "filename")
    }
}
