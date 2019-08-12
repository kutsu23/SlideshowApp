//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 沓掛史典 on 2019/08/12.
//  Copyright © 2019 fuminori.kutsukake. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var slide_num = 1
    var playButtonFlag = 0

    // タイマー
    var timer: Timer!
    
    // タイマー用の時間のための変数
    var timer_sec: Float = 0

    var img1 = UIImage(named: "01_spring")!
    var img2 = UIImage(named: "02_summer")!
    var img3 = UIImage(named: "03_fall")!
    var img4 = UIImage(named: "04_winter")!
    
    @IBOutlet weak var showImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showImage.image = img1
    }

    @IBAction func nextButton(_ sender: Any) {
        slide_num += 1
        if slide_num > 4 {
            slide_num = 1
        }
        
        if slide_num == 1 {
            showImage.image = img1
        } else if slide_num == 2 {
            showImage.image = img2
        } else if slide_num == 3 {
            showImage.image = img3
        } else if slide_num == 4 {
            showImage.image = img4
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        slide_num -= 1
        if slide_num < 1 {
            slide_num = 4
        }
        
        if slide_num == 1 {
            showImage.image = img1
        } else if slide_num == 2 {
            showImage.image = img2
        } else if slide_num == 3 {
            showImage.image = img3
        } else if slide_num == 4 {
            showImage.image = img4
        }
    }
    
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 2.0
        slide_num += 1
        if slide_num > 4 {
            slide_num = 1
        }
        
        if slide_num == 1 {
            showImage.image = img1
        } else if slide_num == 2 {
            showImage.image = img2
        } else if slide_num == 3 {
            showImage.image = img3
        } else if slide_num == 4 {
            showImage.image = img4
        }

    }

    @IBAction func playButton(_ sender: Any) {
        if playButtonFlag == 0 {
            playButtonFlag = 1
            (sender as AnyObject).setTitle("停止", for: .normal)
            // 再生ボタンを押すとタイマー作成、始動
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
        } else if playButtonFlag == 1 {
            playButtonFlag = 0
            (sender as AnyObject).setTitle("再生", for: .normal)
            self.timer.invalidate()
        }
        
    }
    
    
}

