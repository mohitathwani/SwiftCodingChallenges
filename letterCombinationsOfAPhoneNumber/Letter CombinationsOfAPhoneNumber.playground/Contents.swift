//https://leetcode.com/problems/letter-combinations-of-a-phone-number/description/
//Given a digit string, return all possible letter combinations that the number could represent.
//
//A mapping of digit to letters (just like on the telephone buttons) is given below.
//
//
//
//Input:Digit string "23"
//Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].

func letterCombinations(_ digits: String) -> [String] {
    
    if(digits.count == 0) {return []}
    let map = ["0", "1", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
    
    var result = [""]
    
    for (index,value) in digits.enumerated() {
        guard let convertedDigit = Int("\(value)") else {return []}
        
        let mappedString = map[convertedDigit]
        
        while result[0].count == index {
            let dQElement = result.removeFirst()
            mappedString.forEach({ (c) in
                result.append("\(dQElement)\(c)")
            })
        }
    }
    return result
}
