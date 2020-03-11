#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if ([sadArray count] < 3) {
        return sadArray;
    }
    
    NSMutableArray *happyArray = [NSMutableArray arrayWithArray:sadArray];
    
    long length = [happyArray count];
    long index = 1;
    while (index < length -1) {
        int current = [happyArray[index] intValue];
        int prev = [happyArray[index -1] intValue];
        int next = [happyArray[index +1] intValue];
        if (current > (prev + next)) {
            [happyArray removeObjectAtIndex:index];
            length--;
            if (index > 2) {
                index--;
            }
        } else {
            index++;
        }
    }
    
    return happyArray;
}

@end
