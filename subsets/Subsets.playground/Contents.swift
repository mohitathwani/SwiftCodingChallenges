//https://leetcode.com/problems/subsets/description/
//Given a set of distinct integers, nums, return all possible subsets (the power set).
//
//Note: The solution set must not contain duplicate subsets.
//
//For example,
//If nums = [1,2,3], a solution is:
//
//[
//[3],
//[1],
//[2],
//[1,2,3],
//[1,3],
//[2,3],
//[1,2],
//[]
//]


func subsets(_ nums: [Int]) -> [[Int]] {
    var nums = nums.sorted()
    var tempSubsets = [Int]()
    var result = [[Int]]()
    
    result += [tempSubsets]
    
    func compute(index: Int) {
        
        for i in index..<nums.count {
            tempSubsets += [nums[i]]
            result += [tempSubsets]
            
            compute(index: i + 1)
            tempSubsets.removeLast()
            
        }
    }
    
    compute(index: 0)
    
    return result
}

