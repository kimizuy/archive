//
//  SearchItemTableViewController.swift
//  MySearchApp
//
//  Created by Kimizu Yamasaki on 2016/03/26.
//  Copyright © 2016年 Kimizu Yamasaki. All rights reserved.
//

import UIKit

class SearchItemTableViewController: UITableViewController, UISearchBarDelegate {
    
    //商品情報を格納する配列
    var itemDataArray = [ItemData]()
    
    //商品画像のキャッシュを管理するクラス
    var imageCache = NSCache()
    
    //APIを利用するためのアプリケーションID
    let appid: String = "dj0zaiZpPWFjQXVFUVJhdkR6TiZzPWNvbnN1bWVyc2VjcmV0Jng9MGU-"
    
    //APIのURL
    let entryUrl: String =
    "http://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemSearch"
    
    //数字を金額の形式に整形するためのフォーマッター
    let priceFormat = NSNumberFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //価格のフォーマット設定
        priceFormat.numberStyle = .CurrencyStyle
        priceFormat.currencyCode = "JPY"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - search bar delegate
    //キーボードのsearchボタンがタップされたときに呼び出される
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        //商品検索を行う
        let inputText = searchBar.text
        //入力文字数が0以上かどうかチェックする
        if inputText?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0 {
            //保持している商品を一旦削除
            itemDataArray.removeAll()
            
            //パラメータを指定する
            let parameter = ["appid":appid, "query":inputText]
            
            //パラメータをエンコードしたURLを作成する
            let requestUrl = createRequestUrl(parameter)
            
            //APIをリクエストする
            request(requestUrl)
        }
        //キーボードを閉じる
        searchBar.resignFirstResponder()
    }
    
    //URL作成処理
    func createRequestUrl(parameter :[String:String?]) -> String {
        var parameterString = ""
        for key in parameter.keys {
            if let value  = parameter[key] {
                //既にパラメータが設定された場合
                if parameterString.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0 {
                    parameterString += "&"
                }
                //値をエンコードする
                if let escapedValue =
                    value!.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet()) {
                    parameterString += "\(key)=\(escapedValue)"
                }
            }
        }
        let requestUrl = entryUrl + "?" + parameterString
        return requestUrl
    }
    
    //リクエストを行う
    func request(requestUrl: String) {
        //商品検索APIをコールして商品検索を行う
        let session = NSURLSession.sharedSession()
        
        if let url = NSURL(string: requestUrl) {
            let request = NSURLRequest(URL: url)
            
            let task = session.dataTaskWithRequest(request,
                                                   completionHandler: {
                                                    (data:NSData?, response:NSURLResponse?, error:NSError?)
                                                    -> Void in
                                                    //エラーチェック
                                                    if error != nil {
                                                        //エラー表示
                                                        let alert = UIAlertController(title: "エラー", message: error?.description, preferredStyle: UIAlertControllerStyle.Alert)
                                                        //UIに関する処理はメインスレッド上で行う
                                                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                                        self.presentViewController(alert, animated: true, completion: nil)
                                                        })
                                                        return
                                                    }
                                                    
                                                    //JSONで返却されたデータをパースして格納する
                                                    if let data = data {
                                                        let jsonData = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                                                        
                                                        //データのパース処理
                                                        if let resultSet = jsonData["ResultSet"] as?
                                                            [String:AnyObject]{
                                                            self.parseData(resultSet)
                                                        }
                                                        
                                                        //テーブルの描画処理を実施
                                                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                                        self.tableView.reloadData()
                                                        })
                                                    }
            })
            task.resume()
        }
    }
    
    
    //検索結果をパースして商品リストを作成する
    func parseData(resultSet: [String:AnyObject]){
        if let firstObject = resultSet["0"] as? [String:AnyObject] {
            if let results = firstObject["Result"] as? [String:AnyObject] {
                for key in results.keys.sort() {
                    
                    //Requestのキーは無視する
                    if key == "Request" {
                        continue
                    }
                    
                    //商品アイテム取得処理
                    if  let result = results[key] as? [String:AnyObject] {
                        //商品データ格納オブジェクトを作成
                        let itemData = ItemData()
                        
                        //画像を格納
                        if let itemImageDic = result["Image"] as? [String:AnyObject] {
                            let itemImageUrl = itemImageDic["Medium"] as? String
                            itemData.itemImageUrl = itemImageUrl
                        }
                        
                        //商品タイトルを格納
                        let itemTitle = result["Name"] as? String   //商品名
                        itemData.itemTitle = itemTitle
                        
                        //商品価格を格納
                        if let itemPriceDic = result["Price"] as? [String:AnyObject] {
                            let itemPrice = itemPriceDic["_value"] as? String
                            itemData.itemPrice = itemPrice
                        }
                        
                        //商品のURLを格納
                        let itemUrl = result["Url"] as? String
                        itemData.itemUrl = itemUrl
                        
                        //商品リストに追加
                        self.itemDataArray.append(itemData)
                    }
                }
            }
        }
    }
    
    
    // MARK: - Table View Data Source
    //テーブルセルの取得処理
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
