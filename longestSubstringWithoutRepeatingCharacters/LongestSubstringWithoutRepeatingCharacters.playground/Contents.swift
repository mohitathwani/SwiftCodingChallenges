//https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
//Given a string, find the length of the longest substring without repeating characters.
//
//Examples:
//
//Given "abcabcbb", the answer is "abc", which the length is 3.
//
//Given "bbbbb", the answer is "b", with the length of 1.
//
//Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

func lengthOfLongestSubstring(_ s:String) -> Int {
    var maxLen = 0
    var i = 0
    
    var seenChracters = [Character:Int]()
    var charArray = Array(s)
    
    for j in 0..<s.count {
        if let seenCharIndex = seenChracters[charArray[j]] {
            i = max(i, seenCharIndex)
        }
        
        maxLen = max(maxLen, j - i + 1)
        seenChracters[charArray[j]] = j + 1
    }
    
    return maxLen
    
}

lengthOfLongestSubstring("abcc")
