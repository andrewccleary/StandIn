//
//  QRCodeGenerator.swift
//  WiFiHelper
//
//  Created by Andrew Cleary on 4/24/21.
//

import Foundation
import CoreImage.CIFilterBuiltins
import SwiftUI

func generateQRCode(restaurant: Restaurant, person: StandIn) -> UIImage{
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    let formattedString = restaurant.id.uuidString + ":" + person.id.uuidString
    
    let data = Data(formattedString.utf8)
    filter.setValue(data, forKey: "inputMessage")

    if let outputImage = filter.outputImage {
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgimg)
        }
    }

    return UIImage(systemName: "xmark.circle") ?? UIImage()
}

