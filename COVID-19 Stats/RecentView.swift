//
//  RecentView.swift
//  COVID-19 Stats
//
//  Created by Dwip on 21/05/20.
//  Copyright © 2020 Dwip. All rights reserved.
//

import SwiftUI

struct RecentView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
    @ObservedObject var test = CountryStatisticsFetchRequest()

    
    @State var searchText = ""
    @State var isSearchVisible = false
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                if isSearchVisible {
                    SearchView(searchText: $searchText)
                }
                
                TotalDataView(totalData: covidFetch.totalData)
                ListHeaderView()
                
                List {
                    
                    ForEach(covidFetch.allCountries.filter {
                        self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
                    }, id: \.country) { countryData in
                        
                        NavigationLink(destination:
                        CountryDetailView(countryName: countryData.country)){
                        
                        CountryDataRowView(countryData: countryData)
                        }
                    }
                }
            }//End of the VStack
                .navigationBarTitle("Recent Data")
            .navigationBarItems(trailing:
                
                Button(action: {
                    
                    self.isSearchVisible.toggle()
                    
                    if !self.isSearchVisible{
                        self.searchText = ""
                    }
                    
                },label: {
                    Image(systemName: "magnifyingglass")
                })
            )
        }//End of navigation
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
