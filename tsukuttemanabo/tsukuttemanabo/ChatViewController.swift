//
//  ChatViewController.swift
//  tsukuttemanabo
//
//  Created by serori on 2022/05/02.
//

import UIKit
import MessageKit
import InputBarAccessoryView
import FirebaseFirestore

class ChatViewController: MessagesViewController, MessagesDataSource, MessageCellDelegate, MessagesLayoutDelegate, MessagesDisplayDelegate {
    
    let colors = Colors()
    
    var firestoreData: [FirestoreData] = []
    
    private var userId = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let uuid = UIDevice.current.identifierForVendor?.uuidString {
            userId = uuid
        }
        
        Firestore.firestore().collection("Message").document().setData([
            "date" : Date(),
            "senderId" : "testId",
            "text" : "testText",
            "userName" : "testName"
        ])
        
        Firestore.firestore().collection("Message").getDocuments(completion: {
            (document, error) in
            if error != nil {
                print("ChatViewController:Line(\(#line)):error\(error!)")
            } else {
                if let document = document {
                    for i in 0..<document.count {
                        var storeData = FirestoreData()
                        storeData.date = (document.documents[i].get("date")! as! Timestamp).dateValue()
                        storeData.senderId = document.documents[i].get("senderId")! as? String
                        storeData.text = document.documents[i].get("test") as? String
                        storeData.userName = document.documents[i].get("userName") as? String
                        self.firestoreData.append(storeData)
                        print(self.firestoreData)
                    }
                }
            }
        })
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messageCellDelegate = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messageCellDelegate = self
        messageInputBar.delegate = self
        messagesCollectionView.contentInset.top = 70
        
        let uiView = UIView()
        uiView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 70)
        view.addSubview(uiView)
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = colors.white
        label.text = "Doctor"
        label.frame = CGRect(x: 0, y: 20, width: 100, height: 40)
        label.center.x = view.center.x
        label.textAlignment = .center
        uiView.addSubview(label)
        
        let backButton = UIButton(type: .system)
        backButton.frame = CGRect(x: 10, y: 30, width: 20, height: 20)
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.tintColor = colors.white
        backButton.titleLabel?.font = .systemFont(ofSize: 20)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        uiView.addSubview(backButton)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 70)
        gradientLayer.colors = [colors.bluePurple.cgColor, colors.blue.cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
        uiView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @objc func backButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    
    func currentSender() -> SenderType {
        <#code#>
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        <#code#>
    }

    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        <#code#>
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

// MARK: InputBarAccessoryViewDelegate
extension ChatViewController: InputBarAccessoryViewDelegate {
    
}
