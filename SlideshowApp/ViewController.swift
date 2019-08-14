//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 沓掛史典 on 2019/08/12.
//  Copyright © 2019 fuminori.kutsukake. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var slide_num = 1           //スライド番号カウンタ（初期値：1）
    var playButtonFlag = 0      //スライドショー実行フラグ
    var timer: Timer!           // タイマー
    var timer_sec: Float = 0    // タイマー用の時間のための変数

    //スライド用画像
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

    //進むボタン押下時の処理
    @IBAction func nextButton(_ sender: Any) {
        print("next button tapped")
        //スライド番号をincrement
        slide_num += 1
        
        //スライド番号が4より大きい場合は1に戻す
        if slide_num > 4 {
            slide_num = 1
        }
        
        //スライド表示用の分岐
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
    
    //戻るボタン押下時の処理
    @IBAction func backButton(_ sender: Any) {
        //スライド番号をdecrement
        slide_num -= 1
        
        //スライド番号が4より大きい場合は1に戻す
        if slide_num < 1 {
            slide_num = 4
        }
        
        //スライド表示用の分岐
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
        if playButtonFlag == 0 { //再生ボタン押下フラグ0のとき
            playButtonFlag = 1 //再生ボタン押下フラグを1へ
            (sender as AnyObject).setTitle("停止", for: .normal) //ボタン名称を「停止」へ
            // 再生ボタンを押すとタイマー作成、始動
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
        } else if playButtonFlag == 1 { //再生ボタン押下フラグ1のとき
            playButtonFlag = 0 //再生ボタン押下フラグを0へ
            (sender as AnyObject).setTitle("再生", for: .normal) //ボタン名称を「再生」へ
            self.timer.invalidate() //タイマをリセット
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のExpansionViewControllerを取得する
        let expansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
        // 遷移先のExpansionViewControllerで宣言しているexpansion_slide_numに値を代入して渡す
        if slide_num == 1 {
            expansionViewController.expansion_slide_num = 1
        } else if slide_num == 2 {
            expansionViewController.expansion_slide_num = 2
        } else if slide_num == 3 {
            expansionViewController.expansion_slide_num = 3
        } else if slide_num == 4 {
            expansionViewController.expansion_slide_num = 4
        }

        
    }

    
    @IBAction func tapAction(_ sender: Any) {
        print("image tapped.")
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    
}

