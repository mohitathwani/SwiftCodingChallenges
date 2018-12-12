//https://leetcode.com/problems/climbing-stairs/
//You are climbing a stair case. It takes n steps to reach to the top.
//
//Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
//
//Note: Given n will be a positive integer.
//
//Example 1:
//
//Input: 2
//Output: 2
//Explanation: There are two ways to climb to the top.
//1. 1 step + 1 step
//2. 2 steps
//Example 2:
//
//Input: 3
//Output: 3
//Explanation: There are three ways to climb to the top.
//1. 1 step + 1 step + 1 step
//2. 1 step + 2 steps
//3. 2 steps + 1 step

import CoreFoundation
func climbStairs(_ n: Int) -> Int {
  if n == 0 {
    return 1
  }
  
  if n == 1 {
    return 1
  }
  
  return climbStairs(n - 1) + climbStairs(n - 2)
}

func climbStairsMemoization(n: Int) -> Int {
  var a = 1
  var b = 1
  
  if n == 0 || n == 1{
    return 1
  }
  
  for _ in 2...n {
    let result = a + b
    a = b
    b = result
  }
  
  return b
}

//CTCI
//You can take either 1, 2, or 3 steps
func ctci(n: Int) -> Int {
  if n < 0 {
    return 0
  }
  if n == 0 || n == 1 {
    return 1
  }
  
  return ctci(n: n - 1) + ctci(n: n - 2) + ctci(n: n - 3)
}

func ctciMemoization(n: Int) -> Int {
  var arr = [Int](repeating: -1, count: n + 1)
  
  func memoization(n: Int) -> Int{
    if n < 0 {
      return 0
    }
    
    if n == 0 || n == 1 {
      arr[n] = 1
      return 1
    }
    
    if arr[n] != -1{
      return arr[n]
    } else {
      arr[n] = memoization(n: n - 1) + memoization(n: n - 2) + memoization(n: n - 3)
    }
    
    return arr[n]
    
  }
  
  memoization(n: n)
  return arr.last!
}

func ctciMemoization2(n: Int) -> Int {
  if n < 0 {
    return 0
  }
  
  if n == 0 || n == 1 {
    return 1
  }
  
  if n == 2 {
    return 2
  }
  
  if n == 3 {
    return 4
  }
  
  var arr = [Int](repeating: -1, count: n + 1)
  
  arr[0] = 1
  arr[1] = 1
  arr[2] = 2
  arr[3] = 4
  
  func memoization(n: Int) -> Int{
    if n < 0 {
      return 0
    }
    
    if arr[n] != -1 {
      return arr[n]
    } else {
      arr[n] = memoization(n: n - 1) + memoization(n: n - 2) + memoization(n: n - 3)
    }
    return arr[n]
  }
  
  return memoization(n: n)
}

ctciMemoization2(n: 3)
