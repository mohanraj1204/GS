import UIKit
extension String {
    
    static func emptyIfNil(_ optionalString: String?) -> String {
        let text: String
        if let unwrapped = optionalString {
            text = unwrapped
        } else {
            text = ""
        }
        return text
    }
    
    func stringByRemovingAll(characters: [Character]) -> String {
        return String(self.filter({ !characters.contains($0) }))
    }
    
    var trimmed:String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }

}
