//
//  RainViewController.swift
//  ViewDidLoad
//
//  Created by Adam Chen on 2024/8/13.
//

import UIKit
import AVFoundation

class RainViewController: UIViewController {

    var bgmlooper: AVPlayerLooper?
    var shootlooper: AVPlayerLooper?
    var zombielooper: AVPlayerLooper?
    var thunderlooper: AVPlayerLooper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //背景音樂
        let bgmUrl = Bundle.main.url(forResource: "bgm02", withExtension: "mp3")!
        let bgmPlayer = AVQueuePlayer()
        let bgmItem = AVPlayerItem(url: bgmUrl)
        bgmlooper = AVPlayerLooper(player: bgmPlayer, templateItem: bgmItem)
        bgmPlayer.play()
        
        //射擊音效
        let shootUrl = Bundle.main.url(forResource: "shooting", withExtension: "mp3")!
        let shootPlayer = AVQueuePlayer()
        let shootItem = AVPlayerItem(url: shootUrl)
        shootlooper = AVPlayerLooper(player: shootPlayer, templateItem: shootItem)
        shootPlayer.play()
        
        //喪屍音效
        let zombieUrl = Bundle.main.url(forResource: "zombie", withExtension: "mp3")!
        let zombiePlayer = AVQueuePlayer()
        let zombieItem = AVPlayerItem(url: zombieUrl)
        zombielooper = AVPlayerLooper(player: zombiePlayer, templateItem: zombieItem)
        zombiePlayer.play()
        
        //打雷音效
        let thunderUrl = Bundle.main.url(forResource: "thunder", withExtension: "mp3")!
        let thunderPlayer = AVQueuePlayer()
        let thunderItem = AVPlayerItem(url: thunderUrl)
        thunderlooper = AVPlayerLooper(player: thunderPlayer, templateItem: thunderItem)
        thunderPlayer.play()
        
        //背景圖
        let backgroundImageView = UIImageView(image: UIImage(named: "street01"))
        backgroundImageView.frame = view.bounds
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        
        //gif動畫_喪屍
        let zombieView = UIImageView(frame: CGRect(x: 260, y: 600, width: 80, height: 147))
        view.addSubview(zombieView)
        var animatedImage = UIImage.animatedImageNamed("zombie-", duration: 1)
        zombieView.image = animatedImage
        
        //gif動畫_射擊
        let shootView = UIImageView(frame: CGRect(x: 0, y: 570, width: 225, height: 175))
        view.addSubview(shootView)
        animatedImage = UIImage.animatedImageNamed("shoot-", duration: 1)
        shootView.image = animatedImage
        
        //gif動畫_打雷
        let thunderImageView = UIImageView(frame: CGRect(x: 100, y: -10, width: 200, height: 250))
        view.addSubview(thunderImageView)
        animatedImage = UIImage.animatedImageNamed("thunder-", duration: 4)
        thunderImageView.image = animatedImage
        
        //下雨動畫
        let rainEmitterCell = CAEmitterCell()
        rainEmitterCell.contents = UIImage(named: "raindrops01")?.cgImage
        rainEmitterCell.birthRate = 40
        rainEmitterCell.lifetime = 10
        rainEmitterCell.velocity = 100
        rainEmitterCell.xAcceleration = -10
        rainEmitterCell.yAcceleration = 50
        rainEmitterCell.scale = 0.6
        rainEmitterCell.scaleRange = 0.3
        rainEmitterCell.scaleSpeed = -0.02
        
        let rainEmitterCell2 = CAEmitterCell()
        rainEmitterCell2.contents = UIImage(named: "raindrops02")?.cgImage
        rainEmitterCell2.birthRate = 20
        rainEmitterCell2.lifetime = 10
        rainEmitterCell2.velocity = 100
        rainEmitterCell2.xAcceleration = -10
        rainEmitterCell2.yAcceleration = 50
        rainEmitterCell2.scale = 0.6
        rainEmitterCell2.scaleRange = 0.3
        rainEmitterCell2.scaleSpeed = -0.02
        
        let rainEmitterLayer = CAEmitterLayer()
        rainEmitterLayer.emitterCells = [rainEmitterCell, rainEmitterCell2]
        rainEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width, y: -10)
        rainEmitterLayer.emitterSize = CGSize(width: view.bounds.width + 200, height: 0)
        rainEmitterLayer.emitterShape = .line
        view.layer.addSublayer(rainEmitterLayer)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
