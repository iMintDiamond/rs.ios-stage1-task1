#import "PalindromeSolver.h"

@implementation PalindromeSolver

Boolean isPalindrome(NSString *string) {
    NSUInteger leftIndex = 0;
    NSUInteger rightIndex = string.length -1;

    while(rightIndex > leftIndex){
        if ([string characterAtIndex:leftIndex] == [string characterAtIndex:rightIndex]) {
            leftIndex++;
            rightIndex--;
        } else {
            return false;
        }
    }

    return true;
}

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    char *string = calloc([s length] +1, 1);
    strncpy(string, (char *)[s UTF8String], [s length]);
    
    long length = [n longValue];
    long allowedChanges = [k longValue];
    long differentCharacters = 0;

    for (long i = 0, j = length -1; i < length /2; i++, j--) {
        if (string[i] != string[j]){
            differentCharacters++;
        }
    }
    
    long leftIndex = 0;
    long rightIndex = [n longValue] - 1;

    if (differentCharacters > allowedChanges){
        return [[NSString alloc] initWithUTF8String:"-1"];
    }

    while(rightIndex >= leftIndex) {
        if (allowedChanges <= 0) {
            break;
        }

        if (string[leftIndex] == string[rightIndex]) {
            if (allowedChanges > 1
                && (allowedChanges-2) >= differentCharacters
                && string[leftIndex] != '9'
            ) {
                string[leftIndex] = '9';
                string[rightIndex] = '9';
                allowedChanges -= 2;
            }
        } else {
            if (allowedChanges > 1
                && (allowedChanges -2) >= (differentCharacters -1)
            ) {
                if (string[leftIndex] != '9') {
                    string[leftIndex] = '9';
                    allowedChanges--;
                }
                if (string[rightIndex] != '9') {
                    string[rightIndex] = '9';
                    allowedChanges--;
                }
            } else {
                if (string[leftIndex] > string[rightIndex]) {
                    string[rightIndex] = string[leftIndex];
                } else {
                    string[leftIndex] = string[rightIndex];
                }
                allowedChanges--;
            }
            differentCharacters--;
        }
        if (leftIndex == rightIndex && allowedChanges > 0) {
            string[leftIndex] = '9';
            allowedChanges--;
        }
        leftIndex++;
        rightIndex--;
    }

    NSString *finalString = [[NSString alloc] initWithUTF8String:string];
    
    return isPalindrome(finalString) ? finalString : [[NSString alloc] initWithUTF8String:"-1"];
}

@end
