//
//  DoubleMetaphoneImpl.m
//  Pods
//
//  Created by Zebulon Frantzich on 3/11/17.
//
//

#import "DoubleMetaphoneImpl.h"

@implementation DoubleMetaphoneImpl
- (NSArray *)calculate: (NSString *)str maxLength: (NSNumber *)max_len {
    const char * their_input = [str UTF8String];
    
    size_t buffer_size =  strlen(their_input) + 1 ;
    char * input = malloc(buffer_size);
    strncpy(input, their_input, buffer_size);
    
    char * results[2];
    
    DoubleMetaphone(input, results, [max_len intValue]);
    char * primary = results[0];
    char * seconday = results[1];
    
    NSArray *returnArray = @[[NSString stringWithUTF8String:primary], [NSString stringWithUTF8String:seconday]];
    
    free(input);
    free(primary);
    free(seconday);
    
    return returnArray;
}
@end
