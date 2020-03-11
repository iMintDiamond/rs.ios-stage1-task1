#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSInteger i = 0;
    NSInteger total = 0;
    
    for (NSNumber *partOfBill in bill) {
        if (i != index) {
            total += [partOfBill intValue];
        }
        i++;
    }
    total /= 2;
    
    return total == [sum intValue]
        ? @"Bon Appetit"
        : [@([sum intValue] - total) stringValue];
}

@end
