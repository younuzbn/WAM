import SwiftUI

struct CardView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("burger") // Example image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
             
             
            
            
            // Adjust size as needed
            
            HStack {
                Text("Title")
                    .font(.headline)
                
                Spacer() // Add spacing between text and other content if needed
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 40)
                
            }
        }
        .padding()
        .frame(width: 300, height: 250)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}

struct MenuView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 50) {
                ForEach(1...20, id: \.self) { index in
                    CardView(title: "Card \(index)", description: "This is a sample card number \(index)")
                        .frame(maxWidth: .infinity)
                }
            }
            .padding()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
