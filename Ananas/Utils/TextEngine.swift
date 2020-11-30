//
//  TextEngine.swift
//  Ananas
//
//  Created by Thierry Soulie on 27/11/2020.
//

import Foundation
import Combine

class TextEngine:ObservableObject{
    @Published var textInput = ""
    @Published var textOutput = ""
    private var worker:AnyCancellable? = nil
    
    init(){
        worker = $textInput
//            .print("raw input")
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates{$0 == $1}
//        .print("debounced and duplicates removed")
            .assign(to:\.textOutput, on:self)
    }
}
