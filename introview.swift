//
//  introview.swift
//  Yang's TR 1
//
//  Created by Chia-Hao Yang on 2022/5/27.
//

import SwiftUI

struct introview: View {
    var body: some View {
        VStack{
        Text("Yang's Profile\n楊家豪簡介").font(.largeTitle)
            Image("myphoto").resizable().scaledToFit().clipShape(Circle()).frame(width: 150, height: 150, alignment: .center).padding()
            HStack{
                Image(systemName:"graduationcap").resizable().scaledToFit().frame(width: 30, height: 30, alignment: .center)
                Text("學歷")
            }
            Text("朝陽科技大學資訊科技博士\n亞洲大學資訊科技碩士\n國立台南師範學院語文教育學系").font(.system(size: 14))
            HStack{
                Image(systemName:"bag").resizable().scaledToFit().frame(width: 30, height: 30, alignment: .center)
                Text("經歷")
            }
            Text("臺中市霧峰區僑榮國民小學教師兼主任\n朝陽科技大學資工系兼任助理教授\n朝陽科技大學社工系兼任助理教授").font(.system(size: 14))
            Link(destination: URL(string:"https://www.facebook.com/YangChiaHao9911")!, label: {
                Image("fblogo").resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 50, alignment: .center)
               
            }).padding()
    }
    }
}

struct introview_Previews: PreviewProvider {
    static var previews: some View {
        introview()
    }
}
