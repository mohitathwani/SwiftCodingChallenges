//https://leetcode.com/problems/reverse-linked-list/description/
//Reverse a singly linked list.
//
//click to show more hints.
//
//Hint:
//A linked list can be reversed either iteratively or recursively. Could you implement both?

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

func reverseList(_ head: ListNode?) -> ListNode? {
    var prev: ListNode?
    var temp = head
    
    reverse(prev: &prev, head: &temp)
    
    return prev
}

func reverse( prev: inout ListNode?, head: inout ListNode?) {
    var next: ListNode?
    if head != nil {
        next = head?.next
        head?.next = prev
        prev = head
        head = next
        reverse(prev: &prev, head: &head)
    }
}
