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

func lengthOfLongestSubstring(_ s: String) -> Int {
    var maxLen = 0,i = 0, counter = 0
    var seenCharacters = [Character: Int]()
    
    while counter < s.count {
        let j = s.index(s.startIndex, offsetBy: counter)
        
        if seenCharacters[s[j]] != nil {
            i = max(i, seenCharacters[s[j]]!)
        }
        
        maxLen = max(maxLen, j.encodedOffset - i + 1)
        seenCharacters[s[j]] = j.encodedOffset + 1
        counter = counter + 1
    }
    return maxLen
}

lengthOfLongestSubstring("abcc")
