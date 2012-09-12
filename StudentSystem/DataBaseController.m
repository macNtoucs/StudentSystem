#import "DataBaseController.h"

@implementation DataBaseController

-(id)init{
    [super init];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
     NSMutableArray *temp = [NSMutableArray new];
    [temp addObject:@"數學"];
    [temp addObject:@"大中天"];
    [temp addObject:@"0100"];
    [temp addObject:@"37"];
   [temp addObject:@"物理"];
    [temp addObject:@"大雄"];
    [temp addObject:@"0101"];
    [temp addObject:@"3"];
     [temp addObject:@"物理"];
    [temp addObject:@"兔美"];
    [temp addObject:@"0102"];
    [temp addObject:@"97"];
   [temp addObject:@"數學"];
    [temp addObject:@"高手哥"];
    [temp addObject:@"0103"];
    [temp addObject:@"100"];
    
    [prefs setObject:temp forKey:@"user"];
    [prefs synchronize];
    return self;
}
-(void)SaveStudentName:(NSString *) StudentName StudentID:(NSString *) StudentId Grade:(NSArray *) grade{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSMutableArray *temp = [NSMutableArray arrayWithArray:[self readStudentInfo]];
    [temp addObject:StudentName];
    [temp addObject:StudentId];
    [temp addObject:grade];
    [prefs setObject:temp forKey:@"user"];
    [prefs synchronize];
}

-(NSMutableArray *) readStudentInfo{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSMutableArray* studentInfo = [[prefs objectForKey:@"user"]mutableCopy];
    return studentInfo;
}

+(void)EraseAll{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"user"];
    [[NSUserDefaults standardUserDefaults] synchronize]; 
}
@end
