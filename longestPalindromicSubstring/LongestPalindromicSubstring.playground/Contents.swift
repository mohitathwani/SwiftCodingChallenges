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

func longestPalindrome(_ s:String) -> String {
    var start = 0
    var end = 0

    let charArray = Array(s)
    
    for i in 0..<s.count {
        let length = max(expandAround(i, j: i, charArray: charArray), expandAround(i, j: i + 1, charArray: charArray))
        print(length)
        if length > end - start {
            start = i - (length - 1) / 2
            end = i + (length / 2)
        }
    }
    
    let beginningIndex = s.index(s.startIndex, offsetBy: start)
    let endIndex = s.index(s.startIndex, offsetBy: end)
    return String(s[beginningIndex...endIndex])
}

func expandAround(_ i: Int, j: Int, charArray:[Character]) -> Int {
    var leftIndex = i
    var rightIndex = j
    
    while (leftIndex - 1) >= 0 && (rightIndex + 1) < charArray.count && charArray[leftIndex - 1] == charArray[rightIndex + 1] {
        leftIndex -= 1
        rightIndex += 1
    }
    
    return rightIndex - leftIndex - 1
}

longestPalindrome("aaa")
