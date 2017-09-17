//
//  CcApi.swift
//  champcoin_demo
//
//  Created by Telerain Inc on 9/7/17.
//  Copyright © 2017 Voip Helper. All rights reserved.
//

import Foundation
import Alamofire
//import RNCryptor
import CryptoSwift

postfix operator %

extension String {
    //: ### Base64 encoding a string
    func base64Encoded() -> String? {
        if let data = self.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }
    
    //: ### Base64 decoding a string
    func base64Decoded() -> String? {
        if let data = Data(base64Encoded: self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
}


class CcApi {
    
    let baseUrl: String = "http://secure.tccexchange.org/securetcc/webapi/tccapi.aspx"
    let encKey: String = "HigYnkDbV09p5Qz6"
    let decKey: String = "AnkYpfAwo09b5Pl5"
    
    func ccEncrypt(data: String) -> String? {
        // Reverse
        let requestReversed = String(data.characters.reversed())
        print("reversed", requestReversed)
        // Base64
        let requestEncoded: String = requestReversed.base64Encoded()!
        print("base64", requestEncoded)
        
        do {
            let ivValue: Array<UInt8> = [0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00]
            let aes = try AES(key: encKey, iv: String(bytes: ivValue, encoding: .utf8)!) // aes128
            let ciphertext = try aes.encrypt(Array(requestEncoded.utf8))
            print(ciphertext.toBase64()!)
            
            // Base64
            let enctext = ciphertext.toBase64()!
            let responseDecoded: String = try enctext.decryptBase64ToString(cipher: aes)
            print("response base 64 decoded: ", responseDecoded)

            let decString2: String = responseDecoded.base64Decoded()!
            print("base64 dec", decString2)

            
            let responseReversed: String = String(decString2.characters.reversed())
            
            print(responseReversed)
            
            return ciphertext.toBase64()
        } catch {
        return nil}
        
//        let requestEncodedData: Data = requestEncoded.data(using: .utf8)!
//        // Encryption
//        let ciphertext = RNCryptor.encrypt(data: requestEncodedData, withPassword: encKey)
//        let aesstring : String = ciphertext.base64EncodedString()
//        print(String(data: ciphertext, encoding: .utf8)!)
//        print(aesstring)
        
        
        // Encryption
//        let data: Data = requestEncoded.data(using: .utf8)!
//        let password = "7BCCC6A4D834C6849A8951F887D614C6"
//        let encdata = NSData(base64Encoded: requestEncoded, options: NSDataBase64DecodingIgnoreUnknownCharacters)
//        let ciphertext = RNCryptor.encrypt(data: data, withPassword: encKey)
//        print("enc data", ciphertext)
        //print(String(data: ciphertext, encoding: .utf8)!)
      
       //        let str = "Y2JhPXlla3BwYSZvclA1WCBvdml2PWVtYW5fZWNpdmVkJjIuMXY9bm9pc3JldiYwMzEwNDk0MjA0MzI2Njg9aWVtaSY3NDM0MTAwLjc3PWdubCY3MzE2Nzc2LjkyPXRhbCYzMjFAaHNlZWRhcz1kcm93c3NhcCY1OTIwODQwMDE9ZGlyZWZlciZuaWdvbGVydWNlcz1kb2h0ZW0="
//        let password = AES256CBC.generatePassword()  // returns random 32 char string
        
        // get AES-256 CBC encrypted string
//        let encrypted = AES256CBC.encryptString(str, password: encKey)
        
        // decrypt AES-256 CBC encrypted string
//        let decrypted = AES256CBC.decryptString(encrypted!, password: encKey)
        
        // get AES-256 CBC encrypted string
//        let encrypted : String = AES256CBC.encryptString(requestEncoded, password: encKey)!
//        print(encrypted as Any)
        
        // decrypt AES-256 CBC encrypted string
//        let decrypted : String = AES256CBC.decryptString(encrypted, password: encKey)!
//        print(decrypted as Any)
        
        

    }
    
    func ccDecrypt(data: Data) -> String? {
        
        do {
            print(data)
            let decString = String(data:data, encoding: .utf8)!
//            print(decString)
           
            let ivValue: Array<UInt8> = [0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00]
                let aes = try AES(key: decKey, iv: String(bytes: ivValue, encoding: .utf8)!, blockMode: .CBC, padding: PKCS7()) // aes128
            // Base64
            let responseDecoded: String = try decString.decryptBase64ToString(cipher: aes)
//            print("response base 64 decoded: ", responseDecoded)
            
//            responseDecoded = "fX19fSIuZWNpdmVkIHNpaHQgaHRpdyBuaWdvbCBvdCBzdG5hdyB1b3kgZXJ1cyB1b3kgZXJBLmVjaXZlZC9lbGlib20gdG5lcmVmZmlkIGh0aXcgZXRhcmVwbyB0bnVvY2NhIHJ1b3kgdGFodCBzbWVlcyB0SSI6InRsdXNlciIsIloiOiJkaSJ7OiJuaWdvbCJ7OiJ0b29yIns6InBtYWhjIns"
//                let ciphertext = try aes.decrypt(Array(responseDecoded.utf8))
//                let decString2 = String(bytes: ciphertext, encoding: String.Encoding.utf8)!
//                print(decString2)
            
            let decString2: String = responseDecoded.base64Decoded()!
            
            // Decryption
//            let encData: Data = data.data(using: .utf8)!
//            let decData: Data = try RNCryptor.decrypt(data: encData, withPassword: self.decKey)
//            print(decData)
            
            
       
            
            // Reverse
            let responseReversed: String = String(decString2.characters.reversed())
            
//            print(responseReversed)
            return responseReversed
            // Decryption
//                let originalData = try RNCryptor.decrypt(data: data, withPassword: decKey)
//                // ...
//            let resstring = String(data: originalData, encoding: .utf8)!
//                print("dec data", String(data: originalData, encoding: .utf8)!)
//                return resstring
            
        } catch {
            print(error)
            return "error"
        }
    
    }

    
    func ccPost(data: String, completion: @escaping (String)->()) {
        var urlrequest = URLRequest(url: URL(string: self.baseUrl)!)
        var responsetext: String? = nil
        urlrequest.httpMethod = "POST"
        let ciphertext : String = self.ccEncrypt(data: data)!
        urlrequest.httpBody = ciphertext.data(using: .utf8)
//        urlrequest.httpBody = ciphertext
        let task = URLSession.shared.dataTask(with: urlrequest) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
//                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
//                print("response = \(response)")
            }
            
            print(data);
            
//            let responseString : String = data.base64EncodedString()
//            let responseString: String = String(data: data, encoding: .utf8)!
//            print("responseString = \(responseString)")
            responsetext = self.ccDecrypt(data: data)!
            completion(responsetext!)
           
        }
        task.resume()
    }
}
