//
//  uiappextension.swift
//  Ananas
//
//  Created by Thierry Soulie on 24/11/2020.
//

import Foundation

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}
