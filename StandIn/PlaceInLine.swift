//
//  PlaceInLine.swift
//  StandIn
//
//  Created by Andrew Cleary on 5/5/21.
//

import SwiftUI

struct PlaceInLine: View {
    @Binding var tabSelection: Int
    
    var restaurant: Restaurant = Restaurant(name: "Name")
    var person: StandIn = StandIn(name: "Person Name", phone: "5555555555", createdDate: Date())
    var inLine: Bool = false
    
    var body: some View {
        if inLine {
            VStack{
                Text(restaurant.name)
                Text(person.name)
                Text("Present this QR code at the door when you arrive.")
                QRCode(restaurant: restaurant, person: person)
            }
        }else{
            VStack{
                Text("Uh Oh - looks like we aren't holding your place in line right now.")
                Button(action: {tabSelection = 2}){
                    Text("View Restaurants")
                }
            }
        }
        
    }
}

struct PlaceInLine_Previews: PreviewProvider {
    @State private static var tabSelection: Int = 1
    static var previews: some View {
        PlaceInLine(tabSelection: $tabSelection)
    }
}
