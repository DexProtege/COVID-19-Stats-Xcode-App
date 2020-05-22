//
//  ListHeaderView.swift
//  COVID-19 Stats
//
//  Created by Dwip on 21/05/20.
//  Copyright © 2020 Dwip. All rights reserved.
//

import SwiftUI

struct ListHeaderView: View {
    
    
    
    var body: some View {
        
        HStack{
        Text("Country")
            .fontWeight(.bold)
            .font(.subheadline)
            .frame(width: 90, alignment: .leading)
            .padding(.leading, 15)
            
        Spacer()
            
        Text("Confirmed")
            .fontWeight(.bold)
            .font(.subheadline)
            .frame(height: 40)
            .padding(.leading, 5)
            
        Spacer()
            
        Text("Deaths")
            .fontWeight(.bold)
            .font(.subheadline)
            .frame(width: 55, height: 40)
            .padding(.leading, 5)
        
        
            
        Text("Recovered")
            .fontWeight(.bold)
            .font(.subheadline)
            .frame(width: 100, height: 40, alignment: .center)
            .padding(.leading, -5)
        }
        .background(Color("cardBackgroundGray"))
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}
