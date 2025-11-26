//
//  StringExtensions.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import Foundation
import UIKit

extension String {
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
    
    func makeAttributedString(font type: UIFont, color: UIColor) -> NSMutableAttributedString {
        var attrType: [NSAttributedString.Key: Any]
        attrType = [NSAttributedString.Key.font: type, .foregroundColor: color] as [NSAttributedString.Key: Any]
        return NSMutableAttributedString(string: "\(self)", attributes: attrType)
    }
    
    func capitalizingFirstLetter() -> String {
        let str = self.lowercased()
        return str.prefix(1).capitalized + str.dropFirst()
    }
    
    func strikeThrough() -> NSAttributedString {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributeString.length))
        return attributeString
    }
    
    func underline() -> NSAttributedString {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributeString.length))
        return attributeString
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func imaged() -> UIImage? {
        return UIImage(named: self, in: BundleHelper.bundle(), compatibleWith: nil)
    }
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    
    func setHTMLFromString(font: UIFont) -> NSAttributedString? {
        let modifiedFont = String(format:"<span style=\"font-family: '-apple-system', 'HelveticaNeue'; font-size: \(font.pointSize)\">%@</span>", self)
        do {
            return try NSAttributedString(
                data: modifiedFont.data(using: .unicode, allowLossyConversion: true) ?? Data(),
                options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue],
                documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }

    var isEmptyOrWhitespace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var isNotEmptyOrWhitespace: Bool {
        !isEmptyOrWhitespace
    }
}

