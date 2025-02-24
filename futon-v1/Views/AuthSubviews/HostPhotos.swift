//
//  HostPhotos.swift
//  futon-v1
//
//  Created by Linh Dang on 3/31/24.
//

import SwiftUI

struct HostPhotos: View {
    @Binding var currentState: Int
    @Binding var university: String
    @Binding var graduationYear: Int
    @Binding var tags: [String]
    
    var body: some View {
        ZStack {
            Color("futonLightGray")
                .edgesIgnoringSafeArea(.all)
            
            Image("futon_f_purple")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
                .offset(y: -280)
                
            Button { // back button
                withAnimation {
                    currentState -= 1
                }
            } label: {
                Text("\(Image(systemName: "chevron.left"))")
                    .foregroundColor(Color("futonNavy"))
                    .fontWeight(.medium)
                    .font(.system(size: 30))
            }
            .offset(x: -160, y: -350)
            
            VStack {
                Text("Upload Dorm Photos")
                    .font(.custom("BricolageGrotesque-Medium", size: 34))
                    .frame(width: 250)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 50)
                
                Button {
                    // @todo function call
                    Task{
                        await createUser(
                            user: User(
                                id: UUID().uuidString,
                                name: "Peter",
                                pfpURL: URL(string: "https://images.squarespace-cdn.com/content/v1/624a1c23d68c8a3f214fbe39/60e4886e-faed-4b4c-bec8-e758dc068526/isaac-olander-peter-parker-tobey-maguire-isaac-olander+%281%29.jpg")!,
                                university: "Columbia University",
                                graduationYear: 2026,
                                photos: [
                                    URL(string: "https://i.ytimg.com/vi/0LbOdFhProo/maxresdefault.jpg")!],
                                tags: ["123sq ft - Single", "Mattress", "Single-use Bathroom", "Shoes-Off", "Clean"],
                                rating: 4.95,
                                prompts: UUID().uuidString,
                                requests: []),
                            prompt: "#1 campus tip",
                            answer: "Do not eat Monster dining hall food"
                        )
                    }
                    
                } label: {
                    Text("Camera Roll")
                        .foregroundColor(.white)
                        .padding([.leading, .trailing], 30)
                        .padding([.top, .bottom], 10)
                        .background(Color("futonPurple")) // Use Color to set the background color
                        .cornerRadius(20)
                        .padding([.leading, .trailing], 25)
                        .font(.custom("BricolageGrotesque-Medium", size: 17))
                        .padding(.top, 10)
            }
            }
        }
    }
}

#Preview {
    HostPhotos(currentState: .constant(0), university: .constant("Monsters University"), graduationYear: .constant(2007), tags: .constant(["etc"]))
}
