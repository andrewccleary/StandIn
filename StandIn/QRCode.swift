//
//  QRCode.swift
//  WiFiHelper
//
//  Created by Andrew Cleary on 4/26/21.
//

import SwiftUI

struct QRCode: View {
    var restaurant: Restaurant = Restaurant(name: "Name")
    var person: StandIn = StandIn(name: "Person Name", phone: "5555555555", createdDate: Date())
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 220, height: 220)
                .foregroundColor(.white)
                .shadow(radius: 10)
            Image(uiImage: generateQRCode(restaurant: restaurant, person: person))
                .resizable()
                .interpolation(.none)
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
    }
}

struct QRCode_Previews: PreviewProvider {
    static var previews: some View {
        QRCode()
    }
}
