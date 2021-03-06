//
//  SearchView.swift
//  COVID-19 Tracker
//
//  Created by Dwip on 21/05/20.
//  Copyright © 2020 DexProtege. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        
        HStack{
            TextField("Country...", text: $searchText)
            .padding()
        }
    .frame(height: 50)
    .background(Color("cardBackgroundGray"))
    }
}
