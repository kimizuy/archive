//
//  WebViewController.swift
//  MySearchApp
//
//  Created by Kimizu Yamasaki on 2016/03/26.
//  Copyright © 2016年 Kimizu Yamasaki. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    //商品ページのURL
    var itemUrl: String?
    
    //商品ページを参照するためのWebView
    @IBOutlet weak var webView: UIWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //WebViewのurlを読み込ませてWebページを表示させる
        if let itemUrl = itemUrl {
            if let url = NSURL(string: itemUrl) {
                let request = NSURLRequest(URL: url)
                webView.loadRequest(request)
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
