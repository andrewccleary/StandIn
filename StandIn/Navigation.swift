//
//  Navigation.swift
//  StandIn
//
//  Created by Andrew Cleary on 5/5/21.
//

import SwiftUI

struct Navigation: View {
    @State var tabSelection: Int = 1
    @State var restaurants: [Restaurant] = [Restaurant(name: "O'Sheas"), Restaurant(name: "Fiesta Time Amigos"), Restaurant(name: "Molly Malones"), Restaurant(name: "Outback Steakhouse"), Restaurant(name: "Chick-fil-A")]
    
    var body: some View {
        TabView(selection: $tabSelection,
                content:  {
                    PlaceInLine(tabSelection: $tabSelection).tabItem { Text("My Spot") }.tag(1)
                    RestaurantList(tabSelection: $tabSelection, restaurants: $restaurants).tabItem { Text("Restaurants") }.tag(2)
                })
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
