//
//  Student.h
//  StudentSystem
//
//  Created by MAC R on 12/9/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataBaseController.h"
@interface Student : NSObject
{
    NSString *name;
    NSString *ID;
    NSString *grade;
    NSString *subject;
   
}

@property(retain,nonatomic)  NSString *name;
@property(retain,nonatomic)  NSString *ID;
@property(retain,nonatomic)  NSString *grade;
@property(retain,nonatomic) NSString *subject;

-(void)initData;
@end
