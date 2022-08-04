//
//  ViewController.swift
//  udpTest
//
//  Created by yeoh on 07/07/2021.
//

import UIKit
import CocoaAsyncSocket

class ViewController: UIViewController,GCDAsyncUdpSocketDelegate {
    let IP = "255.255.255.255"
    var udpSocket : GCDAsyncUdpSocket!
    @IBOutlet weak var messageTextview: UITextView!
    @IBOutlet weak var portTextfield: UITextField!
    @IBOutlet weak var messageTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        udpSocket = GCDAsyncUdpSocket(delegate: self, delegateQueue: DispatchQueue.main)
        print(hello(Int: 10))
    }
    @IBAction func bindBtn(_ sender: Any) {
        do {
            try udpSocket.bind(toPort: UInt16(portTextfield.text!)!)
        } catch {
            print("failed connect")
        }
        do {
            try udpSocket.enableBroadcast(true)
            print("broadcast")
        } catch {
            print("not able to broadcast")
        }
        do {
            try udpSocket.beginReceiving()
            print("proceed")
        } catch {
            print("not proceed")
        }
        
    }
    
    func dateString() -> String{
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.string(from: now)
        return date
    }
    func udpSocket(_ sock: GCDAsyncUdpSocket, didReceive data: Data, fromAddress address: Data, withFilterContext filterContext: Any?) {
        //收到資料會執行這段func
        print("didReceiveData")
        var host: NSString?
        var port: UInt16 = 0
        
        GCDAsyncUdpSocket.getHost(&host, port: &port, fromAddress: address)

        print("From \(host!)")
        print("incoming massage: \(String(data: data, encoding: String.Encoding.utf8)!) ")
    }
    
    func hello (Int : Int) ->[Int] {
        var a = Int
        return [a]
    }
    

}

