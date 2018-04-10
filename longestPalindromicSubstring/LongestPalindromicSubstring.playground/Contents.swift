//https://leetcode.com/problems/longest-palindromic-substring/description/
//Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
//
//Example:
//
//Input: "babad"
//
//Output: "bab"
//
//Note: "aba" is also a valid answer.
//
//
//Example:
//
//Input: "cbbd"
//
//Output: "bb"

func longestPalindromeSubstring(_ s:String) -> String {
    if(s.count == 1 || s.isEmpty) {
        return s
    }
    
    var resultMatrix = [[Bool]](repeatElement([Bool](repeatElement(false, count: s.count)), count: s.count))
    var charArray = Array(s)
    
    for i in 0..<s.count {
        resultMatrix[i][i] = true
    }
    
    var startIndex = 0
    var maxLen = 0
    
    //Our loop goes bottom to up, left to right...
    for i in (0...s.count - 2).reversed() {
        for j in (i + 1)..<s.count {
            if(charArray[i] != charArray[j]) {
                resultMatrix[i][j] = false;
            }
            else {
                //j - i < 3 is required for adjacent characters being equal
                resultMatrix[i][j] = true && (resultMatrix[i + 1][j - 1] || j - i < 3)
                
                if resultMatrix[i][j] == true && (j - i + 1) > maxLen {
                    startIndex = i
                    maxLen = j - i + 1
                }
            }
        }
    }
    
    if maxLen == 0 {
        return String(charArray[0])
    }
    
    let beginningIndex = s.index(s.startIndex, offsetBy: startIndex)
    let endIndex = s.index(beginningIndex, offsetBy: maxLen)
    return String(s[beginningIndex..<endIndex])
}
