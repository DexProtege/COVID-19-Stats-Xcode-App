//
//  CountryDetailView.swift
//  COVID-19 Tracker
//
//  Created by Dwip on 21/05/20.
//  Copyright © 2020 DexProtege. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    
    @ObservedObject var countryStatisticsRequest = CountryStatisticsFetchRequest()
    var countryName: String
    
    var body: some View {
        
        VStack{
            VStack{
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.confirmedCases.formatNumber() ?? "Loading...", name: "Confirmed")
                .padding(.top)
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.activeCases.formatNumber() ?? "Loading...", name: "Active Cases")
                CountryDetailRow(number: "+" + (countryStatisticsRequest.detailedCountryData?.newCases.formatNumber() ?? "Loading..."), name: "New Cases")
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.recoveredCases.formatNumber() ?? "Loading...", name: "Recovered Cases", color: .green)
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.testsDone.formatNumber() ?? "Loading...", name: "Tests Done", color: .yellow)
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.criticalCases.formatNumber() ?? "Loading...", name: "Critical Cases", color: .yellow)
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.deaths.formatNumber() ?? "Loading...", name: "Deaths", color: .red)
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.newDeaths.formatNumber() ?? "Loading...", name: "New Deaths", color: .red)
                
                CountryDetailRow(number: String(format: "%.2f", countryStatisticsRequest.detailedCountryData?.fatalityRate ?? 0.0) + "%", name: "Fatality Rate", color: .red)
                CountryDetailRow(number: String(format: "%.2f", countryStatisticsRequest.detailedCountryData?.recoveredRate ?? 0.0) + "%", name: "Recovery Rate", color: .green)
                
                
            }
        .background(Color("cardBackgroundGray"))
        .cornerRadius(8)
        .padding()
            
        Spacer()
        }
        .padding(.top, 1 )
        .navigationBarTitle(countryName)
        .onAppear() {
            self.getStatistics()
        }
    }
    
    private func getStatistics(){
        countryStatisticsRequest.getStatsFor(country: self.countryName.replacingOccurrences(of: " ", with: "-"))
    }
}
