//
//  ViewController.swift
//  Dice吹牛
//
//  Created by Timmy on 2023/12/3.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var diceCup: UIImageView!
    @IBOutlet weak var dicePlate: UIImageView!
    @IBOutlet var diceImageViews: [UIImageView]!
    
    // AVPlayer用於播放音樂
    var player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化時，將dicePlate進行輕微的旋轉
        dicePlate.transform = CGAffineTransform(rotationAngle: .pi / 180 * -2)
    }
    
    
    
    // 骰子擲骰按鈕觸發的事件
    @IBAction func play(_ sender: Any) {
        // 播放擲骰音樂
        let url = Bundle.main.url(forResource: "dicemusic", withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        // 顯示隨機骰子圖片
        let imageNames = ["dice1","dice2","dice3","dice4","dice5","dice6"]
        for diceImageView in diceImageViews {
            diceImageView.image = UIImage(named: imageNames.randomElement()!)
        }
        //  diceImageViews[0].image = UIImage(named: imageNames.randomElement()!)
        //  diceImageViews[1].image = UIImage(named: imageNames.randomElement()!)
        //  diceImageViews[2].image = UIImage(named: imageNames.randomElement()!)
        //  diceImageViews[3].image = UIImage(named: imageNames.randomElement()!)
        //  diceImageViews[4].image = UIImage(named: imageNames.randomElement()!)
        //  diceImageViews[5].image = UIImage(named: imageNames.randomElement()!)
    }
    
    
    // 瞇牌開關設定
    @IBAction func checkSwitch(_ sender: UISwitch) {
        // 根據開關狀態調整diceCup的透明度
        if sender.isOn {
            diceCup.alpha = 0.7
        }else {
            diceCup.alpha = 1
        }
    }
    
    
    // 骰盅開關設定
    @IBAction func openSwitch(_ sender: UISwitch) {
        // 根據開關狀態調整diceCup的垂直位置
        if sender.isOn {
            diceCup.transform = CGAffineTransform(translationX: 0, y: -180)
        }else {
            diceCup.transform = CGAffineTransform(translationX: 0, y: 0)
        }
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        // 檢查是否是晃動手機的事件
        if motion == .motionShake {
            // 在晃動時播放音樂
            let url = Bundle.main.url(forResource: "dicemusic", withExtension: "mp3")!
            let playerItem = AVPlayerItem(url: url)
            player.replaceCurrentItem(with: playerItem)
            player.play()
        }
        
        
    }
}
