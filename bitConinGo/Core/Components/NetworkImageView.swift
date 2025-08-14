//
//  NetworkImageView.swift
//  bitConinGo
//
//  Created by arpit verma on 14/08/25.
//

import SwiftUI

struct NetworkImageView: View {
    let url: String
    let placeholder: String
    let size: CGFloat
    
    @State private var image: UIImage?
    @State private var isLoading = true
    @State private var hasError = false
    
    init(url: String, placeholder: String = "photo", size: CGFloat = 30) {
        self.url = url
        self.placeholder = placeholder
        self.size = size
    }
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
            } else if hasError {
                Image(systemName: placeholder)
                    .font(.system(size: size * 0.6))
                    .foregroundColor(.gray)
                    .frame(width: size, height: size)
            } else {
                ProgressView()
                    .frame(width: size, height: size)
            }
        }
        .onAppear {
            loadImage()
        }
    }
    
    private func loadImage() {
        guard let imageURL = URL(string: url) else {
            hasError = true
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false
                
                if let data = data, let loadedImage = UIImage(data: data) {
                    self.image = loadedImage
                } else {
                    self.hasError = true
                }
            }
        }.resume()
    }
}

struct NetworkImageView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            NetworkImageView(
                url: "https://assets.coingecko.com/coins/images/1/standard/bitcoin.png?1696501400",
                placeholder: "bitcoinsign.circle.fill",
                size: 40
            )
            
            NetworkImageView(
                url: "https://assets.coingecko.com/coins/images/279/standard/ethereum.png?1696501628",
                placeholder: "ethereum.circle.fill",
                size: 40
            )
        }
        .padding()
        .background(Color.theme.background)
    }
}

