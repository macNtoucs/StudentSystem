#import "DataBaseController.h"

@implementation DataBaseController

-(id)init{
    [super init];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSMutableArray *temp = [NSMutableArray new];
    temp = [NSMutableArray arrayWithArray:[self readStudentInfo]];
    if ([temp count]==0){
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
    }
    [prefs setObject:temp forKey:@"user"];
    [prefs synchronize];
    return self;
}
-(void)SaveStudentSubject:(NSString *) subject andName:(NSString *) StudentName StudentID:(NSString *) StudentId Grade:(NSString *) grade{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSMutableArray *temp = [NSMutableArray new];
    temp = [NSMutableArray arrayWithArray:[self readStudentInfo]];
    [temp addObject:subject];
    [temp addObject:StudentName];
    [temp addObject:StudentId];
    [temp addObject:grade];
    [prefs setObject:temp forKey:@"user"];
    [ prefs synchronize] ;
    /* temp = [NSMutableArray arrayWithArray:[self readStudentInfo]];
    [ prefs synchronize] ;*/
}

-(void)removeAStudentWithSubject:(NSString *) subject andName:(NSString *) StudentName{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSMutableArray *temp = [NSMutableArray new];
    temp = [NSMutableArray arrayWithArray:[self readStudentInfo]];
    
    for (int i = 0 ; i < [temp count] ; ++i){
        if ([[temp objectAtIndex:i ] isEqualToString:subject] && [[temp objectAtIndex:i+1 ] isEqualToString:StudentName]){
            [temp removeObjectAtIndex:i];
            [temp removeObjectAtIndex:i];
            [temp removeObjectAtIndex:i];
            [temp removeObjectAtIndex:i];
            break;
        }
    }
    [prefs setObject:temp forKey:@"user"];
    [ prefs synchronize] ;
}

-(NSMutableArray *) readStudentInfo{
    [ [NSUserDefaults standardUserDefaults] synchronize];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSMutableArray* studentInfo = [[prefs objectForKey:@"user"]mutableCopy];
    return studentInfo;
}

+(void)EraseAll{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"user"];
    [[NSUserDefaults standardUserDefaults] synchronize]; 
}
@end
