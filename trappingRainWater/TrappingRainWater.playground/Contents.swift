//https://leetcode.com/explore/interview/card/google/59/array-and-strings/341/
//Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
//
//
//The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!
//
//Example:
//
//Input: [0,1,0,2,1,0,1,3,2,1,2,1]
//Output: 6

func trap(_ height: [Int]) -> Int {
  
  var left = 0
  var right = height.count - 1
  
  var leftMax = 0
  var rightMax = 0
  
  var result = 0
  
  while left < right {
    if height[left] <= height[right]  {
      if height[left] >= leftMax {
        leftMax = height[left]
      } else {
        result += leftMax - height[left]
      }
      left += 1
    } else {
      if height[right] >= rightMax {
        rightMax = height[right]
      } else {
        result += rightMax - height[right]
      }
      right -= 1
    }
  }
  
  return result
}

trap([0,1,0,2,1,0,1,3,2,1,2,1]) == 6
trap([0,1,0]) == 0
trap([0,1,0,1]) == 1
