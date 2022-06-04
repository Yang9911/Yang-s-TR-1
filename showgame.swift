//
//  showgame.swift
//  Yang's TR 1
//
//  Created by Chia-Hao Yang on 2022/5/27.
//

import SwiftUI
import ConfettiSwiftUI
struct showgame: View {
    @Binding var isonshow:Bool
//    @State private var counter = 0
    @State var ans = ""
    @State var res = ""
    @State var btn = "送出答案"
    @State private var ispresented = false
    var body: some View {
        ScrollView {
            VStack {
                
                if incorrect > 6{
                    Image("final").resizable().scaledToFill()
                    
                    TextField("這裡輸入答案", text: $ans).foregroundColor(.red).background(.gray).font(.largeTitle)
                    
                    Button{
                        ispresented = true
                        if  ans == "我的老師真是好神" {
                            res = "恭喜你答對了，全部過關"
                            btn = ""
                            ans = ""
//                            counter = 3
                                
                        } else {
                            res = "答案不對，再想想看！"
                            ans = ""
                            ispresented = true
//                            counter = 0
                        }
                        
                    }label: {
                        Text(btn)
                    }.font(.title).background(Color(.white)).foregroundColor(.blue).cornerRadius(20)
                    
                    HStack{
                        Image("G1").resizable().scaledToFit().frame(width: 150, height: 100, alignment: .center)
                        Image("G2").resizable().scaledToFit().frame(width: 150, height: 100, alignment: .center)
                    }
                    HStack{
                        Image("G3").resizable().scaledToFit().frame(width: 150, height: 100, alignment: .center)
                        Image("G4").resizable().scaledToFit().frame(width: 150, height: 100, alignment: .center)
                    }
                    HStack{
                        Image("G5").resizable().scaledToFit().frame(width: 150, height: 100, alignment: .center)
                        Image("G6").resizable().scaledToFit().frame(width: 150, height: 100, alignment: .center)
                    }
                    HStack{
                        Image("G7").resizable().scaledToFit().frame(width: 150, height: 100, alignment: .center)
                        Image("G8").resizable().scaledToFit().frame(width: 150, height: 100, alignment: .center)
                    }
                    
                } else {
                    Image("t\(tonumber)-2").resizable().scaledToFill()
                    
                    TextField("這裡輸入答案", text: $ans).foregroundColor(.red).background(.gray).font(.title).padding()
                    
                    Button{
                        ans = String.lowercased(ans)()
                        ispresented = true
                        if answer[tonumber] == ans && tonumber == 5 {
                            imagearray[tonumber] = "G\(tonumber)"
                            imagearray[tonumber+1] = "G\(tonumber+1)"
                            incorrect += 1
                            res = "答對了，請選擇下一題"
                            btn = ""
                            ans = ""
//                            counter = 5
                        } else if answer[tonumber] == ans && tonumber == 6 {
                            imagearray[tonumber+1] = "G\(tonumber+1)"
                            imagearray[tonumber+2] = "G\(tonumber+2)"
                            incorrect += 1
                            res = "答對了，請選擇下一題"
                            btn = ""
                            ans = ""
//                            counter = 6
                        } else if answer[tonumber] == ans {
                            imagearray[tonumber] = "G\(tonumber)"
                            incorrect += 1
                            res = "答對了，請選擇下一題"
                            btn = ""
                            ans = ""
//                            counter = 8
                        }else {
                            res = "答案不對，再想想看！"
                            ans = ""
//                            counter = 0
                        }
                        
                    }label: {
                        Text(btn)
                    }.font(.title).background(Color(.white)).foregroundColor(.blue).cornerRadius(20)
                }
                
                Text("按這裡返回").font(.title).padding(.horizontal,6).padding(.vertical,3).foregroundColor(.blue).background(Color(.white)).cornerRadius(20).onTapGesture {
                    isonshow = false
                    
                }
            }.alert(isPresented: $ispresented){
                Alert(
                    title: Text(res)
                )
            }

            
        }
        .onAppear(){
            ans = ""
            res = ""
        }
//        .confettiCannon(counter: $counter, num: 100)
    }
    
    
}


struct showgame_Previews: PreviewProvider {
    static var previews: some View {
        showgame(isonshow: Binding.constant(true))
    }
}
