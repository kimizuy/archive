//
//  MyTodo.swift
//  MyTodoList
//
//  Created by Developer on 2016/03/22.
//  Copyright © 2016年 Developer. All rights reserved.
//

import Foundation

class MyTodo: NSObject, NSCoding {
    
    //Todoのタイトル
    var todoTitle :String?
    
    //Todoを完了したかどうかを表すフラグ
    var todoDone :Bool = false
    
    //コンストラクタ
    override init() {
        
    }
    //NSCodingプロトコルに宣言されているデシリアライズ処理。デコード処理とも呼ばれる。
    required init?(coder aDecoder: NSCoder) {
        todoTitle = aDecoder.decodeObjectForKey("todoTitle") as? String
        todoDone =  aDecoder.decodeBoolForKey("todoDone")
    }
    
    //NSCodingプロトコルに宣言されているシリアライズ処理。エンコード処理とも呼ばれる
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(todoTitle, forKey: "todoTitle")
        aCoder.encodeBool(todoDone, forKey: "todoDone")
    }
}