//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by 沓掛史典 on 2019/08/12.
//  Copyright © 2019 fuminori.kutsukake. All rights reserved.
//

import UIKit

class ExpansionViewController: UIViewController {

    var expansion_slide_num:Int = 1//スライド番号カウンタ

    @IBOutlet weak var showExpansionImage: UIImageView!
    //スライド用画像
    var img1 = UIImage(named: "01_spring")!
    var img2 = UIImage(named: "02_summer")!
    var img3 = UIImage(named: "03_fall")!
    var img4 = UIImage(named: "04_winter")!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(img1)
        
        if expansion_slide_num == 1{
            showExpansionImage.image = img1
        } else if expansion_slide_num == 2{
            showExpansionImage.image = img2
        } else if expansion_slide_num == 3{
            showExpansionImage.image = img3
        } else if expansion_slide_num == 4{
            showExpansionImage.image = img4
        }

        // Do any additional setup after loading the view.
        
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
