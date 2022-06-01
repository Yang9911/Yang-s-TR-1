//
//  report880view.swift
//  Yang's TR 1
//
//  Created by Chia-Hao Yang on 2022/5/28.
//

import SwiftUI
var stagenum = 0
struct report880view: View {
    @State var isreportshow = false
    var body: some View {
        ScrollView {
        VStack {
            Label("880情報局", systemImage: "building.columns").font(.largeTitle)
            }
            Text("特務們您們好：八八零情報局是一個地下的秘密組織，裡面有三個很特別的單位，分別是監聽局、破譯局和行動局。最近組織內好像出現內鬼，原本掌握到的敵方電台全部消失，謝謝你前來協助。")
            Button {
                isreportshow = true
                stagenum = 1
            }label: {
                Text("開始任務")
            }.font(.title).padding(.horizontal,6).padding(.vertical,3).background(Color(.orange)).foregroundColor(.blue).cornerRadius(20)
        
        }
        .overlay(Color.black.opacity(isreportshow ? 1 : 0))
        .overlay(alignment: .top){stage}.animation(.spring(), value: isreportshow)
    }
    
    var stage:some View {
        Group {
            if (isreportshow) {
                
                reportshow(isreportshow :$isreportshow).transition(.slide).padding()

            }
        }
    }
    
    
    
}

struct report880view_Previews: PreviewProvider {
    static var previews: some View {
        report880view()
    }
}
