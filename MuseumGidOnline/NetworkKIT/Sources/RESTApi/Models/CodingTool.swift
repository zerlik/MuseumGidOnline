//
//  CodingTool.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 04/10/2024.
//

import Foundation

final class CodingTool {
    
    private static let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()
    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    class func encodeDataForUploadImages(_ string: String)->Data?{
        if let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true) {
            return data
        } else {
            print("CodingTool couldn't create data")
            return nil
        }
    }
    
    class func encode<T: Codable>(model: T) -> Data? {
        do {
            let data = try self.encoder.encode(model)
            return data
        } catch {
            print("CodingTool couldn't create data")
            return nil
        }
    }
    
    class func decode<T: Codable>(data: Data, _:T.Type) -> T? {
        do {
            let model = try self.decoder.decode(T.self, from: data)
            return model
        } catch {
            print("CodingTool couldn't create model")
            return nil
        }
    }
    
    class func decodeArray<T: Codable>(data: Data, _:T.Type) -> [T]? {
        do {
            let model = try self.decoder.decode([T].self, from: data)
            return model
        } catch {
            print("CodingTool couldn't create model")
            return nil
        }
    }
}


