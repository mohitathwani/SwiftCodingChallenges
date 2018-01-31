//https://leetcode.com/problems/meeting-rooms-ii/description/
//Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), find the minimum number of conference rooms required.
//
//For example,
//Given [[0, 30],[5, 10],[15, 20]],
//return 2.


/**
 * Definition for an interval.
 */
public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}


func minMeetingRooms(_ intervals: [Interval]) -> Int {
    if intervals.count == 0 {
        return 0
    }
    
    let sortedIntervals = intervals.sorted { $0.end < $1.end}
    
    var numRooms = 1
    
    var index = 1
    var base = sortedIntervals[0]
    while index < intervals.count {
        if base.end <= sortedIntervals[index].start {
            
        } else {
            numRooms += 1
            base = sortedIntervals[index]
        }
        
        index += 1
    }
    
    return numRooms
}

minMeetingRooms([Interval(1,5), Interval(8,9), Interval(8,9)])
