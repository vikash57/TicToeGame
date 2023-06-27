//
//  HomeViewController.swift
//  TikTokGame
//
//  Created by Apple on 17/04/23.
//

import UIKit

class HomeViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var gender2AlertMsgLbl: UILabel!
    @IBOutlet weak var player2AlertMsgLbl: UILabel!
    @IBOutlet weak var gender1AlertMsgLbl: UILabel!
    @IBOutlet weak var player1NameAlertMsgLbl: UILabel!
    @IBOutlet weak var playBuuton: UIButton!
    @IBOutlet weak var player2FemaleBuuton: UIButton!
    @IBOutlet weak var player2FemaleImgView: UIImageView!
    @IBOutlet weak var player2MaleButton: UIButton!
    @IBOutlet weak var player2MaleImgView: UIImageView!
    @IBOutlet weak var player1FemaleButton: UIButton!
    @IBOutlet weak var player1FemaleImgView: UIImageView!
    @IBOutlet weak var player1MaleButton: UIButton!
    @IBOutlet weak var player1MaleImgView: UIImageView!
    @IBOutlet weak var player2TextField: UITextField!
    @IBOutlet weak var player1TextField: UITextField!
    
    var Player1gender = ""
    var Player2gender = ""
    
    var dataPlayer = Dictionary<String, String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        player1TextField.delegate = self
        player2TextField.delegate = self
    }
    
    func configureUI() {
        editButton(playBuuton, 12, 0, .clear)
//        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
//            debugPrint("Timer fired")
//        }
        
        player1NameAlertMsgLbl.text = ""
        player1NameAlertMsgLbl.isHidden = true
        player2AlertMsgLbl.text = ""
        player2AlertMsgLbl.isHidden = true
        gender1AlertMsgLbl.text = ""
        gender1AlertMsgLbl.isHidden = true
        gender2AlertMsgLbl.text = ""
        gender2AlertMsgLbl.isHidden = true
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        player2TextField.text = ""
        player1TextField.text = ""
        player1FemaleImgView.image = UIImage(named: "square")
        player1MaleImgView.image = UIImage(named: "square")
        player2FemaleImgView.image = UIImage(named: "square")
        player2MaleImgView.image = UIImage(named: "square")
        Player1gender = ""
        Player2gender = ""
        player1TextField.becomeFirstResponder()
    }

    @IBAction func player1MaleButtonAction(_ sender: Any) {
        gender1AlertMsgLbl.text = ""
        gender1AlertMsgLbl.isHidden = true
        Player1gender = "Male"
        player1MaleImgView.image = UIImage(named: "checkedBox")
        player1FemaleImgView.image = UIImage(named: "square")
    }
    
    @IBAction func player1FemaleButtonAction(_ sender: Any) {
        gender1AlertMsgLbl.text = ""
        gender1AlertMsgLbl.isHidden = true
        Player1gender = "Female"
        player1MaleImgView.image = UIImage(named: "square")
        player1FemaleImgView.image = UIImage(named: "checkedBox")
    }
    
    @IBAction func player2MaleButtonAction(_ sender: Any) {
        gender2AlertMsgLbl.text = ""
        gender2AlertMsgLbl.isHidden = true
        Player2gender = "Male"
        player2MaleImgView.image = UIImage(named: "checkedBox")
        player2FemaleImgView.image = UIImage(named: "square")
    }
    
    @IBAction func player2FemaleButtonAction(_ sender: Any) {
        gender2AlertMsgLbl.text = ""
        gender2AlertMsgLbl.isHidden = true
        Player2gender = "Female"
        player2MaleImgView.image = UIImage(named: "square")
        player2FemaleImgView.image = UIImage(named: "checkedBox")
    }
    
    
    @IBAction func playGamebuttonAction(_ sender: Any) {
        if let pl1 = player1TextField.text {
            dataPlayer["player1Name"] = pl1
        }
        if let pl2 = player2TextField.text {
            dataPlayer["player2Name"] = pl2
        }
        var player1Name = player1TextField.text?.trimmingCharacters(in: .whitespaces)
        var player2Name = player2TextField.text?.trimmingCharacters(in: .whitespaces)
        
        if player1Name?.count == 0 {
            player1NameAlertMsgLbl.text = "Please enter player name"
            player1NameAlertMsgLbl.isHidden = false
        }else if Player1gender == "" {
            gender1AlertMsgLbl.text = "please select the gender"
            gender1AlertMsgLbl.isHidden = false
        }else if player2Name?.count == 0 {
            player2AlertMsgLbl.text = "Please enter player name"
            player2AlertMsgLbl.isHidden = false
            
        }else if Player2gender == "" {
            gender2AlertMsgLbl.text = "Please select the gender"
            gender2AlertMsgLbl.isHidden = false
        }else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TicTokViewController") as! TicTokViewController
            
            vc.Player1gender = self.Player1gender
            vc.Player2gender = self.Player2gender
            vc.dataPlayer = self.dataPlayer
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
       
    }
    
    
    
}

extension HomeViewController {
    
    func editButton(_ btn: UIButton,_ radius: CGFloat,_ wdth: CGFloat,_ color:UIColor) {
        btn.layer.cornerRadius = radius
        btn.layer.borderWidth = wdth
        btn.layer.borderColor = color.cgColor
        btn.layer.masksToBounds = true
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:
        NSRange,replacementString string: String) -> Bool
    {
        if textField == self.player1TextField {
            player1NameAlertMsgLbl.text = ""
            player1NameAlertMsgLbl.isHidden = true
            let maxLength = 12
            let currentString: NSString = textField.text! as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }else if textField == self.player2TextField {
            player2AlertMsgLbl.text = ""
            player2AlertMsgLbl.isHidden = true
            let maxLength = 12
            let currentString: NSString = textField.text! as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }

        return true


    }
}
