//
//  BNRExecutor.h
//  Blocky
//
//  Created by Fabrice Guillaume on 2/2/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRExecutor : NSObject

// Exposting block as property
@property (nonatomic, copy) int (^equation)(int, int);

- (int) computeWithValue:(int)value1 andValue:(int)value2;

@end
