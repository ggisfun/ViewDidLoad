//
//  MickeyViewController.swift
//  ViewDidLoad
//
//  Created by Adam Chen on 2024/8/13.
//

import UIKit
import AVFoundation

class MickeyViewController: UIViewController {

    @IBOutlet weak var fightButton: UIButton!
    var looper: AVPlayerLooper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fightButton.isHidden = true
        //設定Button字體＆大小＆顏色
        var config = UIButton.Configuration.plain()
        var title = AttributedString("FIGHT")
        title.font = UIFont(name: "MonsterBlood", size: 35)
        title.foregroundColor = UIColor(red: 180/255, green: 0, blue: 0, alpha: 1)
        config.attributedTitle = title
        fightButton.configuration = config
        
        //音樂播放
        let url = Bundle.main.url(forResource: "bgm01", withExtension: "mp3")!
        let player = AVQueuePlayer()
        let item = AVPlayerItem(url: url)
        looper = AVPlayerLooper(player: player, templateItem: item)
        player.play()
        
        //漸層背景
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.black.cgColor,
            CGColor(red: 77/255, green: 93/255, blue: 102/255, alpha: 1),
            CGColor(red: 70/255, green: 0/255, blue: 0/255, alpha: 1)
        ]
        gradientLayer.locations = [0, 0.8, 1]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        //畫Mickey
        let mickey = CGRect(x: (view.frame.width - 300)/2, y: 100, width: 300, height: 300)
        let mickeyView = UIView(frame: mickey)
        mickeyView.backgroundColor = UIColor.clear
        view.addSubview(mickeyView)
        
        let mickeyPath = UIBezierPath()
        mickeyPath.move(to: CGPoint(x: 118, y: 96))
        mickeyPath.addQuadCurve(to: CGPoint(x: 109, y: 46), controlPoint: CGPoint(x: 127, y: 68))
        mickeyPath.addQuadCurve(to: CGPoint(x: 30, y: 46), controlPoint: CGPoint(x: 73, y: 13))
        mickeyPath.addQuadCurve(to: CGPoint(x: 16, y: 127), controlPoint: CGPoint(x: -12, y: 90))
        mickeyPath.addQuadCurve(to: CGPoint(x: 67, y: 142), controlPoint: CGPoint(x: 30, y: 144))
        mickeyPath.addQuadCurve(to: CGPoint(x: 70, y: 224), controlPoint: CGPoint(x: 49, y: 189))
        mickeyPath.addQuadCurve(to: CGPoint(x: 150, y: 270), controlPoint: CGPoint(x: 95, y: 270))
        mickeyPath.addQuadCurve(to: CGPoint(x: 230, y: 224), controlPoint: CGPoint(x: 205, y: 270))
        mickeyPath.addQuadCurve(to: CGPoint(x: 233, y: 142), controlPoint: CGPoint(x: 252, y: 189))
        mickeyPath.addQuadCurve(to: CGPoint(x: 283, y: 127), controlPoint: CGPoint(x: 270, y: 144))
        mickeyPath.addQuadCurve(to: CGPoint(x: 271, y: 47), controlPoint: CGPoint(x: 312, y: 90))
        mickeyPath.addQuadCurve(to: CGPoint(x: 192, y: 45), controlPoint: CGPoint(x: 227, y: 13))
        mickeyPath.addQuadCurve(to: CGPoint(x: 182, y: 96), controlPoint: CGPoint(x: 175, y: 68))
        mickeyPath.addQuadCurve(to: CGPoint(x: 118, y: 96), controlPoint: CGPoint(x: 150, y: 80))
        mickeyPath.close()
        
        let mickeyLayer = CAShapeLayer()
        mickeyLayer.path = mickeyPath.cgPath
        mickeyLayer.lineWidth = 5
        mickeyLayer.strokeColor = UIColor(red: 180/255, green: 0, blue: 0, alpha: 1).cgColor
        mickeyLayer.fillColor = UIColor.clear.cgColor
        mickeyView.layer.addSublayer(mickeyLayer)
        
        //設定動畫結束時執行的程式
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            //gif動畫_Mickey
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
            mickeyView.addSubview(imageView)
            let animatedImage = UIImage.animatedImageNamed("mickey-", duration: 1)
            imageView.image = animatedImage
            //mask遮罩
            let maskImageView = UIImageView(image: UIImage(named: "mickeyhead"))
            maskImageView.frame = imageView.bounds
            imageView.mask = maskImageView
            
            self.fightButton.isHidden = false
        }
        //動畫
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 7
        mickeyLayer.add(animation, forKey: nil)
        CATransaction.commit()
        
        //gif動畫_喪屍
        let zombieView = UIImageView(frame: CGRect(x: (view.frame.width - 130)/2, y: 540, width: 130, height: 233))
        view.addSubview(zombieView)
        let animatedImage2 = UIImage.animatedImageNamed("zombie-", duration: 1)
        zombieView.image = animatedImage2
        
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
