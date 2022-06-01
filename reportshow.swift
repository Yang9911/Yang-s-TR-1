//
//  reportshow.swift
//  Yang's TR 1
//
//  Created by Chia-Hao Yang on 2022/5/31.
//

import SwiftUI
import AVFoundation
struct reportshow: View {
    let player = AVPlayer()
    @Binding var isreportshow:Bool
    @State private var ispresented = false
    @State var btn = "送出答案"
    @State var res = ""
    @State var anst = ""
    @State var ansc = ["","sos","重慶","7146","7805","1243","5296","4098"]
    @State var reptitle = ["","情報局監聽敵方電台，伺機竊取重要機密情報，今天凌晨五點，監聽局終於找回五個地下電台，其中還攔截到一段聲音，聽起來像是摩斯密碼，你聽得出來是甚麼嗎？\n提示:三個英文字","甚麼？監聽局搞錯了，原來這是我們特務回傳的訊息，SOS是求救的意思，特務好不容易才逃回情報局，他找到一張牛皮紙，裡面似乎代表的是敵方頭目的代號，時間很緊急，得趕快破解密碼，你知道他的代號是甚麼嗎？提示:兩個國字","太好了，原來「重慶」是敵方頭目的代號，為了追捕他，監聽局不斷探查電台的號碼，這一天他們從秘密電台聽到了這段數字，你能協助破譯局破解密碼嗎？\n提示:四個數字","這是這個電台的台號，成功監聽到這個頻道後，情報局陸續得到很多重要的情報，這天，情報局又收到特務傳回的傳真，裡面記錄著「9067」，但數字已經被加密過，你能解出真正的密碼嗎？提示:四個數字","這是「重慶」藏身的地理座標，情報局馬上派出行動特務，前往追查。特務一直跟蹤到了一座廢棄的倉庫，重慶走進到最深處的一個小房間，就把門鎖上，特務追上去，發現門被密碼鎖給鎖住了，你能破解下方的密碼，打開密碼鎖嗎？\n提示:四個數字","恭喜你打開密碼鎖，但是「重慶」怎麼不見了，特工發現一張紙，旁邊有個正在燃燒的蠟燭，特工把紙放在蠟燭上面烤一烤，紙上浮現下面的符號，你知道這代表甚麼嗎？\n提示:四個數字","5296，我要走囉，可惡的「重慶」，竟然留下這樣的訊息，想必他是逃跑了。這次的任務失敗，只好下次再追捕他了！\n準備離開的時候，發現門居然鎖住了，門口有一個奇怪的密碼，旁邊傳來滴答的定時炸彈，只剩下一分鐘，要趕快破解密碼逃出去，門口這個圖案，找出密碼就可以順利逃出去。\n提示:四個數字"]
    var body: some View {
        ScrollView{
            VStack {
                
            //完成第七關
            if stagenum > 7 {
                Text("恭喜你，順利逃出去了，不過「重慶」還是讓他跑了，希望下次可以順利抓到重慶，找出他的身分！").foregroundColor(.white)
            } else {
                //顯示題目及圖案
                Text(reptitle[stagenum]).foregroundColor(.white)
                //第一題播放音效
                if stagenum == 1 {
                    Button("播放聲音"){
                let fileUrl = Bundle.main.url(forResource: "sos", withExtension: "mp4")!
                                let playerItem = AVPlayerItem(url: fileUrl)
                                self.player.replaceCurrentItem(with: playerItem)
                                self.player.play()
                    }
                }
                //顯示題目圖
            Image("P\(stagenum)").resizable().scaledToFill()
                //輸入答案
                TextField("這裡輸入答案", text: $anst).foregroundColor(.red).background(.gray).font(.title).padding()
                //檢查答案
                Button{
                    anst = String.lowercased(anst)()
                    ispresented = true
                    if ansc[stagenum] == anst {
                        stagenum += 1
                        
                        if stagenum > 7{
                        res = "答對了，恭喜你"
                        btn = ""
                        }else {
                            res = "答對了，請選擇下一關"
                        }
                        anst = ""
                    }else {
                        res = "答案不對，再想想看！"
                        anst = ""
                    }
                    
                }label: {
                    Text(btn)
                }.font(.title)
                    .background(Color(.white)).foregroundColor(.blue).cornerRadius(20)
            }
            
            
            
            
            //返回
            Text("按這裡返回").font(.title).padding(.horizontal,6).padding(.vertical,3).foregroundColor(.blue).background(Color(.white)).cornerRadius(20).onTapGesture {
                isreportshow = false
                }
                
            }
        }.alert(isPresented: $ispresented){
            Alert(
                title: Text(res)
            )}//scrol
    }
}

struct reportshow_Previews: PreviewProvider {
    static var previews: some View {
        reportshow(isreportshow: Binding.constant(true))
    }
}
