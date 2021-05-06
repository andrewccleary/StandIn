//
//  GetInLine.swift
//  StandIn
//
//  Created by Andrew Cleary on 5/5/21.
//

import SwiftUI

struct GetInLine: View {
    @Binding var isShowing: Bool
    @Binding var tabSelection: Int
    @Binding var restaurant: Restaurant
    
    @State var name: String = ""
    @State var phone: String = ""
    
    var body: some View {
        VStack{
            Text("Getting in line for " + restaurant.name)
            TextField("Name", text: $name)
            TextField("Phone", text: $phone)
            Button(action: {
                addToWaitList()
                isShowing.toggle()
                tabSelection = 1
            }){
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.green)
                        .frame(width: 120, height: 40)
                    Text("Confirm")
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    func addToWaitList(){
        let person: StandIn = StandIn(name: name, phone: phone, createdDate: Date())
        restaurant.waitList.append(person)
    }
}

struct GetInLine_Previews: PreviewProvider {
    @State private static var isShowing: Bool = true
    @State private static var tabSelection: Int = 2
    @State private static var restaurant: Restaurant = Restaurant(name: "Chick-fil-A")
    
    
    static var previews: some View {
        GetInLine(isShowing: $isShowing, tabSelection: $tabSelection, restaurant: $restaurant)
    }
}
