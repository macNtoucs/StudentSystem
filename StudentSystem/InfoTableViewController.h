//
//  InfoTableViewController.h
//  StudentSystem
//
//  Created by MAC R on 12/9/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "AddStudentViewController.h"
@interface InfoTableViewController : UITableViewController{
    Student* students[100]; 
    NSMutableArray *AllStudentsInfo;
    NSMutableDictionary *StudentsInfoDic;//key for subject ,value for student;
    NSMutableArray *StudentsDicValue;
    DataBaseController *database;
    int student_count;
}
@property(retain,nonatomic) NSMutableArray *AllStudentsInfo;
@property(retain,nonatomic) DataBaseController *database;
@property(retain,nonatomic) NSMutableDictionary *StudentsInfoDic;
@property(retain,nonatomic)  NSMutableArray *StudentsDicValue;
@end
