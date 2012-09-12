#import <Foundation/Foundation.h>

@interface DataBaseController : NSObject


-(id)init;
-(void)SaveStudentSubject:(NSString *) subject andName:(NSString *) StudentName StudentID:(NSString *) StudentId Grade:(NSString *) grade;
//新增一位學生的資料並保存到資料庫(不會覆蓋原本資料)
-(NSMutableArray *) readStudentInfo;
//資料庫讀取所有學生的資料
-(void)removeAStudentWithSubject:(NSString *) subject andName:(NSString *) StudentName;
+(void)EraseAll;
//清除資料庫所有資料
@end