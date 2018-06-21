//https://leetcode.com/problems/container-with-most-water/description/
//Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
//
//Note: You may not slant the container and n is at least 2.

func maxArea(_ height: [Int]) -> Int {
  var start = 0
  var end = height.count - 1
  
  var maxArea = 0
  
  for _ in 0..<height.count {
    if start == end {
      break
    }
    
    let left = height[start]
    let right = height[end]
    
    maxArea = max(min(left, right) * (end - start), maxArea)
    if left < right {
      start += 1
    } else {
      end -= 1
    }
  }
  
  return maxArea
}

maxArea([4,3,7,8,2,6,9,5])
maxArea([0,1])
