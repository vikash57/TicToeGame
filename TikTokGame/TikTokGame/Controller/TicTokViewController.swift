//
//  TicTokViewController.swift
//  TikTokGame
//
//  Created by Apple on 14/04/23.
//

import UIKit

class TicTokViewController: UIViewController {
    
    @IBOutlet weak var player2WinCountLabel: UILabel!
    @IBOutlet weak var player1WinCountLabel: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2ImageView: UIImageView!
    @IBOutlet weak var player1ImageView: UIImageView!
    @IBOutlet weak var player2View: UIView!
    @IBOutlet weak var player1View: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var img9: UIImageView!
    @IBOutlet weak var img8: UIImageView!
    @IBOutlet weak var img7: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var contentGameView: UIView!
    
    var val1 = 11
    var val2 = 12
    var val3 = 13
    var val4 = 14
    var val5 = 15
    var val6 = 16
    var val7 = 17
    var val8 = 18
    var val9 = 19
    var number = 0
    var player = 0
    
    var timer = Timer()
    var player1Win = 0
    var player2Win = 0
    var Player1gender = ""
    var Player2gender = ""
    var dataPlayer = Dictionary<String, String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        scheduledTimerWithTimeInterval()
//        editPlayerImage(Player1gender, player1ImageView)
//        editPlayerImage(Player2gender, player2ImageView)
        updatePlayer()
        
    }
    
    func configureUI() {
        editView(contentGameView, 12, 0.75, .black)
        editView(titleView, 8, 0.5, .darkGray)
        editBgView(player2View, 12, 0.75, .darkGray, .white)
        editBgView(player1View, 12, 0.75, .darkGray, .red)
        intialStateQue()
        
        player1Label.text = dataPlayer["player1Name"]
        player2Label.text = dataPlayer["player2Name"]
        player1WinCountLabel.text = "\(player1Win)"
        player2WinCountLabel.text = "\(player2Win)"
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting(){
        // NSLog("counting..")
        
        if val1 == val2 && val2 == val3 {
            if val1 == 0 {
                img1.image = UIImage(named: "circule_1_2_3")
                img2.image = UIImage(named: "circule_1_2_3")
                img3.image = UIImage(named: "circule_1_2_3")
            }else if val1 == 1{
                img1.image = UIImage(named: "cros_1_2_3")
                img2.image = UIImage(named: "cros_1_2_3")
                img3.image = UIImage(named: "cros_1_2_3")
            }
            val1 = 11
            updateResult()
            
            
        }else if val3 == val6 && val6 == val9 {
            if val3 == 0 {
                img3.image = UIImage(named: "circule_3_6_9")
                img6.image = UIImage(named: "circule_3_6_9")
                img9.image = UIImage(named: "circule_3_6_9")
            }else if val3 == 1{
                img3.image = UIImage(named: "cros_3_6_9")
                img6.image = UIImage(named: "cros_3_6_9")
                img9.image = UIImage(named: "cros_3_6_9")
            }
            val3 = 13
            updateResult()
        }else if val1 == val4 && val4 == val7 {
            if val1 == 0 {
                img1.image = UIImage(named: "circule_3_6_9")
                img4.image = UIImage(named: "circule_3_6_9")
                img7.image = UIImage(named: "circule_3_6_9")
            }else if val1 == 1{
                img1.image = UIImage(named: "cros_3_6_9")
                img4.image = UIImage(named: "cros_3_6_9")
                img7.image = UIImage(named: "cros_3_6_9")
            }
            val1 = 11
            updateResult()
            
        }else if val7 == val8 && val8 == val9 {
            if val7 == 0 {
                img7.image = UIImage(named: "circule_1_2_3")
                img8.image = UIImage(named: "circule_1_2_3")
                img9.image = UIImage(named: "circule_1_2_3")
            }else if val7 == 1{
                img7.image = UIImage(named: "cros_1_2_3")
                img8.image = UIImage(named: "cros_1_2_3")
                img9.image = UIImage(named: "cros_1_2_3")
            }
            val8 = 18
            updateResult()
            
        }else if val1 == val5 && val5 == val9 {
            if val1 == 0 {
                img1.image = UIImage(named: "circule_1_5_9")
                img5.image = UIImage(named: "circule_1_5_9")
                img9.image = UIImage(named: "circule_1_5_9")
            }else if val1 == 1{
                img1.image = UIImage(named: "cros_1_5_9")
                img5.image = UIImage(named: "cros_1_5_9")
                img9.image = UIImage(named: "cros_1_5_9")
            }
            val1 = 11
            updateResult()
            
        }else if val7 == val5 && val5 == val3 {
            if val7 == 0 {
                img7.image = UIImage(named: "circule_7_5_3")
                img5.image = UIImage(named: "circule_7_5_3")
                img3.image = UIImage(named: "circule_7_5_3")
            }else if val7 == 1{
                img7.image = UIImage(named: "cros_7_5_3")
                img5.image = UIImage(named: "cros_7_5_3")
                img3.image = UIImage(named: "cros_7_5_3")
            }
            val7 = 17
            updateResult()
            
        }else if val4 == val5 && val5 == val6 {
            if val4 == 0 {
                img4.image = UIImage(named: "circule_1_2_3")
                img5.image = UIImage(named: "circule_1_2_3")
                img6.image = UIImage(named: "circule_1_2_3")
            }else if val4 == 1{
                img4.image = UIImage(named: "cros_1_2_3")
                img5.image = UIImage(named: "cros_1_2_3")
                img6.image = UIImage(named: "cros_1_2_3")
            }
            val4 = 14
            updateResult()
            
        }else if val2 == val5 && val5 == val8 {
            if val2 == 0 {
                img2.image = UIImage(named: "circule_3_6_9")
                img5.image = UIImage(named: "circule_3_6_9")
                img8.image = UIImage(named: "circule_3_6_9")
            }else if val2 == 1{
                img2.image = UIImage(named: "cros_3_6_9")
                img5.image = UIImage(named: "cros_3_6_9")
                img8.image = UIImage(named: "cros_3_6_9")
            }
            val2 = 12
            updateResult()
            
        }else if (val1 == 0 || val1 == 1) && (val2 == 0 || val2 == 1) && (val3 == 0 || val3 == 1) && (val4 == 0 || val4 == 1) && (val5 == 0 || val5 == 1) && (val6 == 0 || val6 == 1) && (val7 == 0 || val7 == 1) && (val8 == 0 || val8 == 1) && (val9 == 0 || val9 == 1) {
            val1 = 11
            showAlert(title: "TicTokMatch Result", message: "Sorry, match tie")
            editBgView(player1View, 12, 0.75, .darkGray, .white)
            editBgView(player2View, 12, 0.75, .darkGray, .white)
        }
    }
    
    
    func updatePlayer() {
        
        if player % 2 == 0 {
            editBgView(player2View, 12, 0.75, .darkGray, .white)
            editBgView(player1View, 12, 0.75, .darkGray, .red)
        }else {
            editBgView(player2View, 12, 0.75, .darkGray, .red)
            editBgView(player1View, 12, 0.75, .darkGray, .white)
        }
    }
    
    func updateResult() {
        if player % 2 == 0 {
            showAlert(title: "TicTokMatch Result", message: "Congrates! \(String(describing: dataPlayer["player2Name"]!)) won")
            print("player 2", player)
            player2Win = player2Win + 1
            player2WinCountLabel.text = "\(player2Win)"
            editBgView(player1View, 12, 0.75, .darkGray, .white)
            editBgView(player2View, 12, 0.75, .darkGray, .red)
        }else {
            showAlert(title: "TicTokMatch Result", message: "Congrates! \(String(describing: dataPlayer["player1Name"]!)) won")
            player1Win = player1Win + 1
            print("player 1", player)
            player1WinCountLabel.text = "\(player1Win)"
            editBgView(player1View, 12, 0.75, .darkGray, .red)
            editBgView(player2View, 12, 0.75, .darkGray, .white)
        }
    }
    
    @IBAction func btn1Action(_ sender: Any) {
        
        if val1 != 0 && val1 != 1 {
            player = player + 1
            number = number + 1
            if number % 2 == 0 {
                val1 = 0
                img1.image = UIImage(named: "circule")
                updatePlayer()
            } else {
                val1 = 1
                img1.image = UIImage(named: "cross")
                updatePlayer()
            }
        }
        
        
    }
    
    @IBAction func btn2Action(_ sender: Any) {
       
        if val2 != 0 && val2 != 1 {
            player = player + 1
            number = number + 1
            if number % 2 == 0 {
                val2 = 0
                img2.image = UIImage(named: "circule")
                updatePlayer()
            } else {
                val2 = 1
                img2.image = UIImage(named: "cross")
                updatePlayer()
            }
        }
        
    }
    
    @IBAction func btn3Action(_ sender: Any) {
        
        if val3 != 0 && val3 != 1 {
            player = player + 1
            number = number + 1
            if number % 2 == 0 {
                val3 = 0
                img3.image = UIImage(named: "circule")
                updatePlayer()
            } else {
                val3 = 1
                img3.image = UIImage(named: "cross")
                updatePlayer()
            }
        }
        
    }
    
    @IBAction func btn4Action(_ sender: Any) {
        
        if val4 != 0 && val4 != 1 {
            player = player + 1
            number = number + 1
            if number % 2 == 0 {
                val4 = 0
                img4.image = UIImage(named: "circule")
                updatePlayer()
            } else {
                val4 = 1
                img4.image = UIImage(named: "cross")
                updatePlayer()
            }
        }
        
    }
    
    @IBAction func btn5Action(_ sender: Any) {
        
        if val5 != 0 && val5 != 1 {
            player = player + 1
            number = number + 1
            if number % 2 == 0 {
                val5 = 0
                img5.image = UIImage(named: "circule")
                updatePlayer()
            } else {
                val5 = 1
                img5.image = UIImage(named: "cross")
                updatePlayer()
            }
        }
        
    }
    
    @IBAction func btn6Action(_ sender: Any) {
        
        if val6 != 0 && val6 != 1 {
            player = player + 1
            number = number + 1
            if number % 2 == 0 {
                val6 = 0
                img6.image = UIImage(named: "circule")
                updatePlayer()
            } else {
                val6 = 1
                img6.image = UIImage(named: "cross")
                updatePlayer()
            }
        }
        
    }
    
    @IBAction func btn7Action(_ sender: Any) {
        
        if val7 != 0 && val7 != 1 {
            player = player + 1
            number = number + 1
            if number % 2 == 0 {
                val7 = 0
                img7.image = UIImage(named: "circule")
                updatePlayer()
            } else {
                val7 = 1
                img7.image = UIImage(named: "cross")
                updatePlayer()
            }
        }
        
    }
    
    @IBAction func btn8Action(_ sender: Any) {
        
        if val8 != 0 && val8 != 1 {
            player = player + 1
            number = number + 1
            if number % 2 == 0 {
                val8 = 0
                img8.image = UIImage(named: "circule")
                updatePlayer()
            } else {
                val8 = 1
                img8.image = UIImage(named: "cross")
                updatePlayer()
            }
        }
        
    }
    
    @IBAction func btn9Action(_ sender: Any) {
        
        if val9 != 0 && val9 != 1 {
            player = player + 1
            number = number + 1
            if number % 2 == 0 {
                val9 = 0
                img9.image = UIImage(named: "circule")
                updatePlayer()
            } else {
                val9 = 1
                img9.image = UIImage(named: "cross")
                updatePlayer()
            }
        }
        
    }
    
    
}

extension TicTokViewController {
    
    func editView(_ view: UIView,_ radius: CGFloat,_ wdth: CGFloat,_ color:UIColor) {
        view.layer.cornerRadius = radius
        view.layer.borderWidth = wdth
        view.layer.borderColor = color.cgColor
        view.layer.masksToBounds = true
        
    }
    
    func editBgView(_ view: UIView,_ radius: CGFloat,_ wdth: CGFloat,_ color:UIColor,_ bgColor: UIColor) {
        view.layer.cornerRadius = radius
        view.layer.borderWidth = wdth
        view.layer.borderColor = color.cgColor
        view.backgroundColor = bgColor
        view.layer.masksToBounds = true
        
    }
    
    func intialStateQue() {
        img1.image = UIImage(named: "square")
        img2.image = UIImage(named: "square")
        img3.image = UIImage(named: "square")
        img4.image = UIImage(named: "square")
        img5.image = UIImage(named: "square")
        img6.image = UIImage(named: "square")
        img7.image = UIImage(named: "square")
        img8.image = UIImage(named: "square")
        img9.image = UIImage(named: "square")
        val1 = 11
        val2 = 12
        val3 = 13
        val4 = 14
        val5 = 15
        val6 = 16
        val7 = 17
        val8 = 18
        val9 = 19
        player = 0
        updatePlayer()
        
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:
                                                    message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            self.intialStateQue()
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func editPlayerImage(_ value1 : String, _ Img : UIImageView) {
        if value1 == "Male" {
            Img.image = UIImage(named: "boyPlayer")
        }else {
            Img.image = UIImage(named: "girlPlayer")
        }
    }
    
}


