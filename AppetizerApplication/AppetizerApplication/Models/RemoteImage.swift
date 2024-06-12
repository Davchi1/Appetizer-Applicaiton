//
//  RemoteImage.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 5/23/24.
//

import SwiftUI

final class ImageLoader: ObservableObject{
    
    @Published var image: Image? = nil
    
    func loadImage(fromURLString urlString: String){
        NetworkManager.shared.downloadImage(fromURLString: urlString){ uiImage in
          //  print("Loading Image " + urlString)
            guard let uiImage = uiImage else{
                return
            }
            
            DispatchQueue.main.async{
                self.image = Image(uiImage: uiImage)
            }
            
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View{
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View{
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    var body: some View{
        RemoteImage(image: imageLoader.image)
            .onAppear{imageLoader.loadImage(fromURLString: urlString)}
    }
}
