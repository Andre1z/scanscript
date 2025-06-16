//
//  OCRScannerView.swift
//  
//
//  Created by Andrei Buga on 13/6/25.
//

import SwiftUI
import VisionKit

struct OCRScannerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let documentCameraVC = VNDocumentCameraViewController
        documentCameraVC.delegate = context.coordinator
        return documentCameraVC
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context){
        // No se requiere actualización dinámica en este ejemplo
    }
    
    func makeCoordinator() -> Coordinator{
        return Coordinator()
    }

    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate{
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            // Aquí procesamos las imágenes escaneadas y aplicaríamos OCR
            print("Scan Completado con \(scan.pageCount) página(s).")
            
            // Por ejemplo: Iterar sobre cada página e invocar OCRService para obtener el texto.
            // Queda pendiente integrar la lógica de procesamiento.
            
            controller.dismoss(animated: true)
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            controller.dismiss(animated: true)
        }
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error){
            print("Error al escanear: \(error.localizedDescription)")
            controller.dismiss(animated: true)
        }
    }
}
