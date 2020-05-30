//
//  PhotoViewController.swift
//  MyPhotoDiary
//
//  Created by Kimizu Yamasaki on 2016/03/26.
//  Copyright © 2016年 Kimizu Yamasaki. All rights reserved.
//

import UIKit

// プロトコルを作る。
protocol PhotoViewControllerDelegate {
    func photoViewController (viewController: PhotoViewController, item: AnyObject)
}

class PhotoViewController: UIViewController {
    var item: [String: AnyObject]?
    let documentsDir = NSHomeDirectory() + "/Documents"
    
    var delegate:PhotoViewControllerDelegate!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let item = item else { return }
        
        let id = item["ID"] as? String ?? ""
        let year = item["YEAR"] as? String ?? ""
        let day = item["DAY"] as? String ?? ""
        navigationItem.title = "\(year) \(day)"
        
        let image = UIImage(contentsOfFile: photoPath(id))
        photoImageView.image = image
    }
    
    func photoPath(id: String) -> String {
        return documentsDir + "/" + id + ".jpg"
    }
    
    @IBAction func tapTrashButton(sender: AnyObject) {
        //let viewController = ViewController()
        
        
        let alertController = UIAlertController(title: "確認", message: "この写真を削除します。よろしいですか？", preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "はい", style: UIAlertActionStyle.Default, handler:{
            (action:UIAlertAction!) -> Void in
            
            // if respondstoselecterをswiftで書く。trueならself.delegateのメソッドを呼び出すコード
            self.delegate.photoViewController(self, item: self.item!)
            
        })
        //OKボタンを追加
        alertController.addAction(okAction)
        
        //CANCELボタンがタップされたときの処理
        let cancelButton = UIAlertAction(title: "いいえ", style: UIAlertActionStyle.Cancel, handler: nil)
        //CANCELボタンを追加
        alertController.addAction(cancelButton)
        
        //アラートダイアログを表示
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
}
