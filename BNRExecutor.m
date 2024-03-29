//
//  BNRExecutor.m
//  Blocky
//
//  Created by Fabrice Guillaume on 2/2/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import "BNRExecutor.h"

// Sending the message setEquation: to an instance of BNRExecutor gives it a reference
// to a block. Sending the message computeWithValue:andValue: will execute that
// block – passing in the two int arguments – and return the result.

@implementation BNRExecutor

@synthesize equation;

- (int)computeWithValue:(int)value1 andValue:(int)value2
{
    NSLog(@"\t[Executor] computeWithValue based on equation");
    // If a block variable is executed but doesn't point at a block
    // it will crash - return 0 if there is no block
    if (!equation)
        return 0;
    
    // return value of block with value1 and value 2
    return equation(value1, value2);

}


- (void) dealloc {
    NSLog(@"\t[Executor] being destroyed.");
}

@end
