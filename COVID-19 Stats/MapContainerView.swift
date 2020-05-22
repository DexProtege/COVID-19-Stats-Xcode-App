//
//  MapContainerView.swift
//  COVID-19 Tracker
//
//  Created by Dwip on 22/05/20.
//  Copyright © 2020 DexProtege. All rights reserved.
//

import SwiftUI

struct MapContainerView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
    
    var body: some View {
        
        MapView(countryData: $covidFetch.allCountries)
        
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}
