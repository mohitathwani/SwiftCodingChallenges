//https://leetcode.com/problems/merge-k-sorted-lists/description/
//Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
//
//Example:
//
//Input:
//[
//1->4->5,
//1->3->4,
//2->6
//]
//Output: 1->1->2->3->4->4->5->6

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
  guard lists.count > 0 else {
    return nil
  }
  
  guard lists.count >= 2 else {
    return lists.first!
  }
  
  var tempLists = lists
  
  while tempLists.count > 1 {
    guard let l1 = tempLists[0] else {
      tempLists.removeFirst()
      continue
    }
    
    tempLists.removeFirst()
    guard let l2 = tempLists[0] else {
      tempLists.removeFirst()
      tempLists.append(l1)
      continue
    }
    
    tempLists.removeFirst()
    tempLists.append(merge(l1: l1, l2: l2))
  }
  
  return tempLists.first!
}

func merge(l1: ListNode, l2: ListNode) -> ListNode? {
  var list1: ListNode? = l1
  var list2: ListNode? = l2
  
  if l1 === l2 {
    return l1
  }
  
  let result = ListNode(0)
  var tail: ListNode? = result
  
  while list1 != nil && list2 != nil {
    if (list1?.val)! <= (list2?.val)! {
      tail?.next = list1
      tail = tail?.next
      list1 = list1?.next
    } else {
      tail?.next = list2
      tail = tail?.next
      list2 = list2?.next
    }
  }
  
  if list1 == nil {
    while list2 != nil {
      tail?.next = list2
      tail = tail?.next
      list2 = list2?.next
    }
  }
  
  if list2 == nil {
    while list1 != nil {
      tail?.next = list1
      tail = tail?.next
      list1 = list1?.next
    }
  }
  
  return result.next
  
}

let l1 = ListNode(-2)
l1.next = ListNode(-1)
l1.next?.next = ListNode(-1)

let l2 = ListNode(2)
l2.next = ListNode(4)
l2.next?.next = ListNode(6)
l2.next?.next?.next = ListNode(8)

let l3 = ListNode(0)
l3.next = ListNode(3)
l3.next?.next = ListNode(7)


var result = mergeKLists([l1, nil])
//var result = merge(l1: l1, l2: l2)
while result != nil {
  print(result?.val)
  result = result?.next
}
