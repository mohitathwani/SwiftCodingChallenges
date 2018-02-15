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

func longestPalindrome(_ s: String) -> String {
    var resultMatrix = [[Bool]](repeatElement([Bool](repeatElement(false, count: s.count)), count: s.count))
    
    for i in 0..<s.count {
        resultMatrix[i][i] = true
    }
    
    var startIndex = String.Index(encodedOffset: 0)
    var endIndex = String.Index(encodedOffset: 0)
    var maxLen = 0
    
    
    
    for i in (0...s.count - 2).reversed() {
        for j in (i+1 ..< s.count) {
            let iIndex = s.index(s.startIndex, offsetBy: i)
            let jIndex = s.index(s.startIndex, offsetBy: j)
            
            if s[iIndex] != s[jIndex] {
                resultMatrix[i][j] = false
            }
            else {
                resultMatrix[i][j] = true && (resultMatrix[i + 1][j - 1] || j - i < 3) //j - i < 3 is the trick here else it will not work for strings less than length 3
                if resultMatrix[i][j] == true && j - i + 1 > maxLen {
                    maxLen = j - i + 1
                    startIndex = iIndex
                    endIndex = jIndex
                }
            }
        }
    }
    
    
    
    
//    for column in 0..<s.count {
//        var i = 0, j = column + 1
//
//        while i < s.count && j < s.count {
//
//            let iIndex = s.index(s.startIndex, offsetBy: i)
//            let jIndex = s.index(s.startIndex, offsetBy: j)
//
//            if s[iIndex] != s[jIndex] {
//                resultMatrix[i][j] = false
//            }
//            else {
//                resultMatrix[i][j] = true && (resultMatrix[i + 1][j - 1] || j - i < 3) //j - i < 3 is the trick here else it will not work for strings less than length 3
//                if resultMatrix[i][j] == true && j - i + 1 > maxLen {
//                    maxLen = j - i + 1
//                    startIndex = iIndex
//                    endIndex = jIndex
//                }
//            }
//            i += 1
//            j += 1
//        }
//    }
    return String(s[startIndex...endIndex])
}

//longestPalindrome("dababacd")
longestPalindrome("civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth")

