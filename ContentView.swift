//
//  ContentView.swift
//  Teaching resource
//
//  Created by Chia-Hao Yang on 2022/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
        VStack {
            //作者宣告
            profileview.padding()
            
            //小益老師
            Text("小益老師遊戲(內容版權屬於洪進益老師)")
                    .font(.headline)
            NavigationLink(destination:tacogameview()) {
                VStack {
                        Image("tacologo").resizable().scaledToFit().frame(width: 100, height: 100, alignment: .center)
                        Text("章魚遊戲")
                    }
            }.padding()
//
                NavigationLink(destination:report880view()) {
                    VStack {
                    Image(systemName: "building.columns").resizable().scaledToFit().frame(width: 100, height: 100, alignment: .center)
                    Text("880情報局")
                }
                }.padding()
                //第三個遊戲
            NavigationLink(destination:mathescapeview()) {
                VStack {
                Image(systemName: "figure.walk").resizable().scaledToFit().frame(width: 100, height: 100, alignment: .center)
                Text("逃出數學密室")
            }
            }.padding()
                Spacer()
            
            //第二段
            fbview.padding()
            Spacer()
            
        }
    }
    }


var profileview: some View {
    //作者宣告
    HStack {
        Text("Yang's teaching resource package")
                        .font(.title)
                        .padding()
    
    NavigationLink(destination:introview()) {
        VStack {
        Image(systemName: "person.circle.fill").resizable().scaledToFit().frame(width: 50, height: 50, alignment: .center)
                            Text("楊家豪")
            }
        }
    }
}
    
var fbview: some View{
    //第二段FB
    HStack {
        Link(destination: URL(string:"https://www.facebook.com/STARMATH")!, label: {
            Image("fblogo").resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 50, alignment: .center)
            Text("小益布拉格廣場")
            })
        }
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
