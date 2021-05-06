//
//  RestaurantDetail.swift
//  StandIn
//
//  Created by Andrew Cleary on 5/5/21.
//

import SwiftUI

struct RestaurantDetail: View {
    @Binding var tabSelection: Int
    @Binding var restaurant: Restaurant
    
    @State var showingSheet: Bool = false
    
    var body: some View {
        VStack{
            Text(restaurant.name)
            Text(String(restaurant.waitList.count) + " parties in line")
            Text(String(restaurant.waitList.count * 25) + "-" + String(restaurant.waitList.count * 45))
            Button(action: {showingSheet.toggle()}){
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.blue)
                        .frame(width: 120, height: 40)
                    Text("Get In Line")
                        .foregroundColor(.white)
                }
            }.sheet(isPresented: $showingSheet, content: {
                GetInLine(isShowing: $showingSheet, tabSelection: $tabSelection, restaurant: $restaurant)
            })
        }
    }
}

struct RestaurantDetail_Previews: PreviewProvider {
    @State private static var tabSelection: Int = 2
    @State private static var restaurant: Restaurant = Restaurant(name: "Olive Garden", waitList: [StandIn(name: "Andrew Cleary", phone: "502-298-3533", createdDate: Date())])
    
    static var previews: some View {
        RestaurantDetail(tabSelection: $tabSelection, restaurant: $restaurant)
    }
}
