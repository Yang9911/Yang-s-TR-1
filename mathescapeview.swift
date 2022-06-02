//
//  mathescapeview.swift
//  Yang's TR 1
//
//  Created by Chia-Hao Yang on 2022/5/31.
//

import SwiftUI
var mathnum = 0
struct mathescapeview: View {
    @State var ismathshow = false
    
    var body: some View {
        ScrollView{
            VStack{
                Label("逃出數學密室", systemImage: "figure.walk").font(.largeTitle).padding()
                Text("以下關卡，全部的答案都是阿拉伯數字或英文\n準備好了嗎？\n按下按鈕就開始囉！")
                    .multilineTextAlignment(.center).padding()
                Button {
                    ismathshow = true
                    mathnum = 1
                }label: {
                    Text("開始闖關")
                }.font(.title).padding(.horizontal,6).padding(.vertical,3).background(Color(.orange)).foregroundColor(.blue).cornerRadius(20)
                
            }
            
        }.overlay(Color.black.opacity(ismathshow ? 1 : 0))
            .overlay(alignment: .top){mathstage}.animation(.spring(), value: ismathshow)
    }
    var mathstage:some View {
        Group {
            if (ismathshow) {
                
                mathshowview(ismathshow :$ismathshow).transition(.slide).padding()
                
            }
        }
    }
}

struct mathescapeview_Previews: PreviewProvider {
    static var previews: some View {
        mathescapeview()
    }
}
