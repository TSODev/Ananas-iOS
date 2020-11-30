//
//  TestGlobalState.swift
//  Ananas
//
//  Created by Thierry Soulie on 30/11/2020.
//

import SwiftUI

struct GlobalState: View {

    var anomalies: AnomalieContainer
        
        
        var body: some View {
            
            HStack {
                if (anomalies.count > 0) {

                            Image(systemName: "person.crop.circle.badge.exclamationmark")
                                .font(.system(size: 40, weight: .regular))
                                .foregroundColor(Color(.systemGray4))

                    }
                    else
                    {
                    Image(systemName: "person.crop.circle.badge.checkmark")
                        .font(.system(size: 40, weight: .regular))
                        .foregroundColor(Color(.systemGray4))
                    }
                }
        }
        

    struct TestGlobalState_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                GlobalState(anomalies: AnomalieContainer(anomalies: [sampleAnomalie1, sampleAnomalie2]))
            }
        }
    }
    }
