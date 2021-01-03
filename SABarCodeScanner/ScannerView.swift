//
//  ScannerView.swift
//  SABarCodeScanner
//
//  Created by Thomas Prezioso Jr on 1/1/21.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    @Binding var scannedCode: String
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        private var scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            print(error.rawValue)
        }
        
        
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannedCode: .constant("123456789"))
    }
}
