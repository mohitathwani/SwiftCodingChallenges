//https://leetcode.com/problems/search-in-rotated-sorted-array/description/
//Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
//
//(i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
//
//You are given a target value to search. If found in the array return its index, otherwise return -1.
//
//You may assume no duplicate exists in the array.
//
//Your algorithm's runtime complexity must be in the order of O(log n).
//
//Example 1:
//
//Input: nums = [4,5,6,7,0,1,2], target = 0
//Output: 4
//Example 2:
//
//Input: nums = [4,5,6,7,0,1,2], target = 3
//Output: -1


func search(_ nums: [Int], _ target: Int) -> Int {
  guard nums.count > 0 else {
    return -1
  }
  
  var start = 0
  var end = nums.count - 1
  
  func search(start: Int, end: Int) -> Int {
    
    if end < start {
      return -1
    }
    
    let mid = start + (end - start) / 2
    
    print(start, mid, end)
    
    if nums[mid] == target {
      return mid
    }
    
    
    //lower half is sorted
    if nums[start] <= nums[mid] {
      if target >= nums[start] && target <= nums[mid] {
        //search in lower half
        return search(start: start, end: mid - 1)
      } else {
        //search in upper half
        return search(start: mid + 1, end: end)
      }
    }
    
    //upper half is sorted
    if nums[mid] < nums[end] {
      if target >= nums[mid] && target <= nums[end] {
        //search in upper half
        return search(start: mid + 1, end: end)
      } else {
        //search in lower half
        return search(start: start, end: mid - 1)
      }
      
    }
    
    return -1
  }
  
  return search(start: 0, end: nums.count - 1)
}

//search([4,5,6,7,8,0,1,2], 4)
//search([4,5,6,7,8,0,1,2], 5)
//search([4,5,6,7,8,0,1,2], 6)
//search([4,5,6,7,8,0,1,2], 7)
//search([4,5,6,7,8,0,1,2], 8)
//search([4,5,6,7,8,0,1,2], 0)
search([4,5,6,7,8,0,1,2], 1)
//search([4,5,6,7,8,0,1,2], 2)

