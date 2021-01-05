//
//  Alert.swift
//  SABarCodeScanner
//
//  Created by Thomas Prezioso Jr on 1/5/21.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let alertButton: Alert.Button
}

struct AlertContext {
    static let invaildDeviceInput = AlertItem(title: "Invaild Device Input", message: "Something is Wrong with the Camera. We are Unable to Caputure the Input", alertButton: .default(Text("OK")))

    static let invaildScannedType = AlertItem(title: "Invaild Scan Type", message: "The Value Scanned is Not Valid. This App Scans Only EAN-8 and EAN-13 Barcodes", alertButton: .default(Text("OK")))
}
