//https://leetcode.com/problems/add-two-numbers/description/
//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
//Example
//
//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8
//Explanation: 342 + 465 = 807.

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    }
    
    if l2 == nil {
        return l1
    }
    
    var temp1 = l1
    var temp2 = l2
    
    var resultNode: ListNode!
    var tailNode = resultNode
    var sum = 0
    var carry = 0
    while (temp1 != nil && temp2 != nil) {
        sum = temp1!.val + temp2!.val + carry
        carry = sum / 10
        sum = sum % 10
        
        if resultNode == nil {
            resultNode = ListNode(sum)
            tailNode = resultNode
        } else {
            tailNode?.next = ListNode(sum)
            tailNode = tailNode?.next
        }
        
        temp1 = temp1!.next
        temp2 = temp2!.next
    }
    
    if temp1 != nil {
        while temp1 != nil {
            sum = temp1!.val + carry
            carry = sum / 10
            sum = sum % 10
            tailNode?.next = ListNode(sum)
            tailNode = tailNode?.next
            temp1 = temp1!.next
        }
    }
    
    if temp2 != nil {
        while temp2 != nil {
            
            sum = temp2!.val + carry
            carry = sum / 10
            sum = sum % 10
            tailNode?.next = ListNode(sum)
            tailNode = tailNode?.next
            temp2 = temp2!.next
        }
    }
    
    if carry == 1 {
        tailNode?.next = ListNode(carry)
        tailNode = tailNode?.next
    }
    return resultNode
}

