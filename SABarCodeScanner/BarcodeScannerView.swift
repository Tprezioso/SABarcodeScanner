//
//  BarcodeScannerView.swift
//  SABarCodeScanner
//
//  Created by Thomas Prezioso Jr on 12/21/20.
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

struct BarcodeScannerView: View {
    
    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $scannedCode, alertItem: $alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                Spacer().frame(height: 60)
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                Text(scannedCode.isEmpty ? "Not yet scanned" : scannedCode)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundColor(scannedCode.isEmpty ? .red : .green)
                    .padding()
                
            }.navigationTitle("Barcode Scanner")
            .alert(item: $alertItem) { alertItem in
                Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.alertButton)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
