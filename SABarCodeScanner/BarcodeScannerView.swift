//
//  BarcodeScannerView.swift
//  SABarCodeScanner
//
//  Created by Thomas Prezioso Jr on 12/21/20.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @State private var scannedCode = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $scannedCode)
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
