//
//  MainView.swift
//  Ananas
//
//  Created by Thierry Soulie on 17/11/2020.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @ObservedObject var appState = DataController.shared
    
    var body: some View {
        if appState.appIsLoading {
            LoadingScreen()
        } else {
            if horizontalSizeClass == .compact {
                AnanasTabView()
            } else {
                AnanasSidebarView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
