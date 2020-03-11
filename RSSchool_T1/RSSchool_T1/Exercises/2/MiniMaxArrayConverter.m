#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    NSInteger sum = 0;
    for (NSNumber *number in array) {
      sum += [number intValue];
    }
    
    NSInteger max = sum - [[array valueForKeyPath:@"@min.self"] intValue];
    NSInteger min = sum - [[array valueForKeyPath:@"@max.self"] intValue];
    
    return @[
        [[NSNumber alloc] initWithLong:min],
        [[NSNumber alloc] initWithLong:max]
    ];
}

@end
