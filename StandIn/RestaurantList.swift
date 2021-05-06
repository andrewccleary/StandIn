//
//  RestaurantList.swift
//  StandIn
//
//  Created by Andrew Cleary on 5/5/21.
//

import SwiftUI

struct StandIn: Identifiable {
    let id: UUID = UUID()
    var name: String
    var phone: String
    var createdDate: Date
    var checkedIn: Bool = false
}

struct Restaurant: Identifiable {
    let id: UUID = UUID()
    var name: String
    var waitList: [StandIn] = []
}

struct RestaurantList: View {
    @Binding var tabSelection: Int
    @Binding var restaurants: [Restaurant]
    
    @State var inLine: Bool = false
    
    var body: some View {
        NavigationView{
            List(restaurants.indices, id: \.self){ index in
                NavigationLink(destination: RestaurantDetail(tabSelection: $tabSelection, restaurant: $restaurants[index])){
                    HStack{
                        Text(restaurants[index].name)
                        Spacer()
                        Text(String(restaurants[index].waitList.count))
                    }
                }
            }.navigationTitle("Restaurants")
        }
    }
}

struct RestaurantList_Previews: PreviewProvider {
    @State private static var tabSelection: Int = 2
    @State private static var restaurants: [Restaurant] = [Restaurant(name: "O'Sheas"), Restaurant(name: "Fiesta Time Amigos"), Restaurant(name: "Molly Malones"), Restaurant(name: "Outback Steakhouse"), Restaurant(name: "Chick-fil-A")]
    
    static var previews: some View {
        RestaurantList(tabSelection: $tabSelection, restaurants: $restaurants)
    }
}
