#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSMutableArray *parenthesesBracketPosition = [NSMutableArray new];
    NSMutableArray *squareBracketsPosition = [NSMutableArray new];
    NSMutableArray *angleBracketsPosition = [NSMutableArray new];
    NSMutableDictionary *resultWithStartPos = [NSMutableDictionary new];
    char *chars = (char *)[string UTF8String];
    
    for(int index = 0; index < [string length]; index++) {
        switch (chars[index]) {
            case '(':
                [parenthesesBracketPosition addObject:[NSNumber numberWithInteger:(index +1)]];
                break;
            case '[':
                [squareBracketsPosition addObject:[NSNumber numberWithInteger:(index +1)]];
                break;
            case '<':
                [angleBracketsPosition addObject:[NSNumber numberWithInteger:(index +1)]];
                break;
            
            case ')':
                if ([parenthesesBracketPosition count] > 0) {
                    NSNumber *lastOpenPosition = [parenthesesBracketPosition lastObject];
                    [parenthesesBracketPosition removeLastObject];
                    
                    NSUInteger location = [lastOpenPosition unsignedIntegerValue];
                    NSUInteger length = index - [lastOpenPosition intValue];
                    
                    NSString *substring = [string substringWithRange:NSMakeRange(location, length)];
                    [resultWithStartPos setObject:substring forKey:[NSNumber numberWithUnsignedInteger:location]];
                }
                break;
            case ']':
                if ([squareBracketsPosition count] > 0) {
                    NSNumber *lastOpenPosition = [squareBracketsPosition lastObject];
                    [squareBracketsPosition removeLastObject];
                    
                    NSUInteger location = [lastOpenPosition unsignedIntegerValue];
                    NSUInteger length = index - [lastOpenPosition intValue];
                    
                    NSString *substring = [string substringWithRange:NSMakeRange(location, length)];
                    [resultWithStartPos setObject:substring forKey:[NSNumber numberWithUnsignedInteger:location]];
                }
                break;
            case '>':
                if ([angleBracketsPosition count] > 0) {
                    NSNumber *lastOpenPosition = [angleBracketsPosition lastObject];
                    [angleBracketsPosition removeLastObject];
                    
                    NSUInteger location = [lastOpenPosition unsignedIntegerValue];
                    NSUInteger length = index - [lastOpenPosition intValue];
                    
                    NSString *substring = [string substringWithRange:NSMakeRange(location, length)];
                    [resultWithStartPos setObject:substring forKey:[NSNumber numberWithUnsignedInteger:location]];
                }
                break;
        }
    }
    
    NSMutableArray *result = [NSMutableArray new];
    NSArray *keys = [resultWithStartPos.allKeys sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]]];
    for (NSNumber *key in keys) {
        [result addObject:resultWithStartPos[key]];
    }
    
    return result;
}

@end
