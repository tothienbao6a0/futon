//
//  RequestBox.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI
import Kingfisher

struct RequestBox: View { // @todo - add a reason for the request
    var request: Request
    
    @State var viewed = false // @future save conversation status
    
    @State var isShowingProfile = false
    
    var body: some View {
        VStack {
            HStack {
                KFImage(request.user.pfpURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 50)
                
                VStack(alignment: .leading) {
                    Text("Request from \(request.user.name)")
                        .font(.custom("BricolageGrotesque-Medium", size: 17))
                    
                    Text("\(request.user.university) \(String(request.user.graduationYear))")
                        .font(.custom("BricolageGrotesque-Regular", size: 15))
                    
                }
                
                Spacer()
            }
            
            Text(request.dates)
                .font(.custom("BricolageGrotesque-Regular", size: 30))
                .padding(.bottom, 10)
                        
            Button {
                isShowingProfile = true
            } label: {
                Text("Tap to View")
                    .font(.custom("BricolageGrotesque-Medium", size: 17))
                    .padding([.top, .bottom], 7)
                    .padding([.leading, .trailing], 25)
                    .background(Color("futonNavy"))
                    .cornerRadius(40)
                    .foregroundColor(.white)
            }
            .sheet(isPresented: $isShowingProfile){
                RequestProfile(user: request.user)
            }
            
            Spacer()
        }
        .padding(15)
        .frame(width: 366, height: 200)
        .background(.white)
        .cornerRadius(20)
    }
}

struct RequestBox_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            RequestBox(request: sampleRequest)
        }
    }
}
