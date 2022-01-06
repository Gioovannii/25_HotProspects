//
//  MeView.swift
//  HotProspects
//
//  Created by Giovanni Gaffé on 2021/12/30.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {
    @State private var name = "Anonymous"
    @State private var emailAdresss = "you@yoursite.com"
    @State private var qrCode = UIImage()
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)
                
                TextField("Email adress", text: $emailAdresss)
                    .textContentType(.emailAddress)
                    .font(.title)
                
                
                Image(uiImage: qrCode)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .contextMenu {
                        Button {
                            let imageSaver = ImageSaver()
                            imageSaver.writeToPhotoAlbum(image: qrCode)
                        } label: {
                            Label("Save to photos", systemImage: "square.and.arrow.down")
                        }
                    }
                    .navigationTitle("Your code")
                    .onAppear(perform: updateCode)
                    .onChange(of: name) { _ in updateCode() }
                    .onChange(of: emailAdresss) { _ in updateCode() }
            }
        }
    }
    
    func updateCode() {
        qrCode = generateQRCode(from: "\(name)\n\(emailAdresss)")
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
                
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
