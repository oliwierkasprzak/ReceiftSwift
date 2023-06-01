//
//  ReceiptScanner.swift
//  ReceiftSwift
//
//  Created by Oliwier Kasprzak on 01/06/2023.
//

import SwiftUI
import Vision
import VisionKit

struct ReceiptScanner: UIViewControllerRepresentable {
    @Binding var scannedText: String?

    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let documentCameraViewController = VNDocumentCameraViewController()
        documentCameraViewController.delegate = context.coordinator
        return documentCameraViewController
    }

    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(scannedText: $scannedText)
    }

    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        @Binding var scannedText: String?

        init(scannedText: Binding<String?>) {
            _scannedText = scannedText
        }

        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            let extractedText = processImage(scan.imageOfPage(at: 0))
            scannedText = extractedText
            controller.dismiss(animated: true, completion: nil)
        }

        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            controller.dismiss(animated: true, completion: nil)
        }

        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            print("Document scanner error: \(error.localizedDescription)")
        }

        private func processImage(_ image: UIImage) -> String? {
            guard let cgImage = image.cgImage else { return nil }
            let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])

            let textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
                guard let observations = request.results as? [VNRecognizedTextObservation] else { return }

                let extractedText = observations.compactMap { observation in
                    observation.topCandidates(1).first?.string
                }.joined(separator: "\n")

                print("Extracted Text: \(extractedText)")
                // You can further process or manipulate the extracted text as per your requirements.

                // Return the extracted text
                self.scannedText = extractedText
            }

            textRecognitionRequest.recognitionLevel = .accurate
            textRecognitionRequest.recognitionLanguages = ["en"] // Set the desired recognition language(s)

            do {
                try requestHandler.perform([textRecognitionRequest])
            } catch {
                print("Text recognition error: \(error.localizedDescription)")
            }

            return nil
        }
    }
}
