//
//  tacoview.swift
//  Yang's TR 1
//
//  Created by Chia-Hao Yang on 2022/5/27.
//

import SwiftUI

var tonumber = 0
var imagearray = ["","t1","t2","t3","t4","t5","0","t6","0"]
var answer = ["","5025","star","22","黃色","592","16"]
var incorrect = 0
struct tacogameview: View {
    @State var isonshow = false
    
    var body: some View {
        ScrollView{
            VStack{
                HStack {
                    Text("章魚遊戲").font(.largeTitle)
                    Image("tacologo").resizable().scaledToFit().frame(width: 100, height: 100, alignment: .center)
                }
                Text("下面總共六個關卡，通過六個關卡可以收集八張圖卡，用八張圖卡通過最後一關，即完成本遊戲任務").font(.caption)
                if incorrect >= 6{
                    Button{
                        tonumber = 7
                        isonshow = true
                        incorrect += 1
                    }
                label:{
                    Text("請前往最後一關").font(.largeTitle)
                }
                }
                //        第二排
                HStack {
                    Button{
                        tonumber = 1
                        isonshow = true
                    }
                label:{
                    Image(imagearray[1]).resizable().scaledToFit().frame(width: 150, height: 100, alignment: .center)
                    
                }
                    Button{
                        tonumber = 2
                        isonshow = true
                    }
                label:{
                    Image(imagearray[2]).resizable().scaledToFit().frame(width: 150, height: 100, alignment: .center)
                }
                }
                //第三排
                HStack {
                    Button{
                        tonumber = 3
                        isonshow = true
                    }
                label:{
                    Image(imagearray[3]).resizable().scaledToFit().frame(width: 150, height: 100, alignment: .center)
                    
                }
                    Button{
                        tonumber = 4
                        isonshow = true
                    }
                label:{
                    Image(imagearray[4]).resizable().scaledToFit().frame(width: 150, height: 100, alignment: .center)
                }
                }
                //第四排
                HStack {
                    Button{
                        tonumber = 5
                        isonshow = true
                    }
                label:{
                    Image(imagearray[5]).resizable().scaledToFit().frame(width: 150, height: 100, alignment: .center)
                    
                }
                    
                    if imagearray[6] != "0" {
                        Image(imagearray[6]).resizable().scaledToFit().frame(width: 150, height: 100, alignment: .center)
                    }
                }
                //第五排
                HStack {
                    Button{
                        tonumber = 6
                        isonshow = true
                    }
                label:{
                    Image(imagearray[7]).resizable().scaledToFit().frame(width: 150, height: 100, alignment: .center)
                    
                }
                    
                    if imagearray[8] != "0" {
                        Image(imagearray[8]).resizable().scaledToFit().frame(width: 150, height: 100, alignment: .center)
                    }
                }
            }
        }.padding().overlay(Color.black.opacity(isonshow ? 0.8 : 0)).overlay(alignment: .top){preshow}.animation(.spring(), value: isonshow)//scroll
    }
    
    var preshow: some View{
        Group{
            
            if (isonshow) {
                showgame(isonshow :$isonshow).transition(.slide).padding()
                
            }
            
        }
    }
    
}
struct tacogameview_Previews: PreviewProvider {
    static var previews: some View {
        tacogameview()
    }
}
