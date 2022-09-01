////
////  File.swift
////  MovieRanker
////
////  Created by Techugo on 01/05/17.
////  Copyright © 2017 Arpit. All rights reserved.
////
//
//import Foundation
//
//final class Singleton {
//    var socket:WebSocket?
//    var socketNotification:WebSocket?
//
//    // Can't init is singleton
//    private init() { }
//    
//    // MARK: Shared Instance
//    
//    static let shared = Singleton()
//    func connectToSocket(strUrl:String,observerName:String)
//    {
//        if socket != nil {
//            
//            if (socket?.isConnected)! {
//                socket?.disconnect()
//            }
//        }
//        socket = WebSocket(url: URL(string: strUrl)!, protocols: [])
//        //socket?.delegate = self
//        //websocketDidConnect
//        socket?.onConnect = {
//        }
//        //websocketDidDisconnect
//        socket?.onDisconnect = { (error: NSError?) in
//        }
//        //websocketDidReceiveMessage
//        socket?.onText = { (text: String) in
//            
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: observerName), object: text)
//            
//        }
//        //websocketDidReceiveData
//        socket?.onData = { (data: Data) in
//        }
//        //you could do onPong as well.
//        socket?.connect()
//        
//        
//    }
//
//    func connectToSocketForNotification(strUrl:String,observerName:String)
//    {
//        socket = WebSocket(url: URL(string: strUrl)!, protocols: [])
//        //socket?.delegate = self
//        //websocketDidConnect
//        socket?.onConnect = {
//        }
//        //websocketDidDisconnect
//        socket?.onDisconnect = { (error: NSError?) in
//        }
//        //websocketDidReceiveMessage
//        socket?.onText = { (text: String) in
//          
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: observerName), object: text)
//            
//        }
//        //websocketDidReceiveData
//        socket?.onData = { (data: Data) in
//        }
//        //you could do onPong as well.
//        socket?.connect()
//        
//        
//    }
//    
//}

