//
//  mathshowview.swift
//  Yang's TR 1
//
//  Created by Chia-Hao Yang on 2022/5/31.
//

import SwiftUI
import ConfettiSwiftUI
struct mathshowview: View {
    @Binding var ismathshow:Bool
//    @State private var counter = 0
    @FocusState var istextFocused:Bool
    @State private var ispresented = false
    @State var btn = "送出答案"
    @State var res = ""
    @State var anst = ""
    @State var ansc = ["","63","912","ten","90","76","eight"]
    var body: some View {
        ScrollView{
            VStack{
                
                if mathnum > 6 {
                    Text("完成闖關！").font(.largeTitle).foregroundColor(.white)
                    Text("恭喜你，順利通過數學密室關卡").foregroundColor(.white).font(.largeTitle)
                } else {
                    //顯示題目及圖案
                    Text("第\(mathnum)關").font(.largeTitle).foregroundColor(.white)
                    Image("R\(mathnum)a").resizable().scaledToFill()
                    Image("R\(mathnum)").resizable().scaledToFill()
                    
                    //輸入答案
                    TextField("這裡輸入答案", text: $anst).foregroundColor(.red).background(.gray).font(.title).padding().focused($istextFocused).onTapGesture {
                        istextFocused = true
                    }
                    //檢查答案
                    Button{
                        anst = String.lowercased(anst)()
                        istextFocused = false
                        if ansc[mathnum] == anst {
                            mathnum += 1
                            
//                            counter = 6
                            if mathnum > 6{
                                btn = ""
                                res = "答對了，恭喜通過最後一關"
                                
                            } else {
                                res = "答對了，請繼續前往下一關"
                            }
                            
                            anst = ""
                            
                        }else {
                            res = "答案不對，再想想看！"
                            anst = ""
//                            counter = 0
                        }
                        //顯示訊息匡
                        ispresented = true
                    }label: {
                        Text(btn)
                    }.font(.title)
                        .background(Color(.white)).foregroundColor(.blue).cornerRadius(20)
                }
                //返回
                Text("按這裡返回").font(.title).padding(.horizontal,6).padding(.vertical,3).foregroundColor(.blue).background(Color(.white)).cornerRadius(20).onTapGesture {
                    ismathshow = false
                }
                }
        }.alert(isPresented: $ispresented){
            Alert(
                title: Text(res)
            )}
//        .confettiCannon(counter: $counter, num: 100)
        //scroll
    }
}

struct mathshowview_Previews: PreviewProvider {
    static var previews: some View {
        mathshowview(ismathshow: Binding.constant(true))
    }
}
