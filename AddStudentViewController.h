//
//  AddStudentViewController.h
//  StudentSystem
//
//  Created by mini server on 12/9/12.
//
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "infoTableViewController.h"
@interface AddStudentViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>{
IBOutlet UIPickerView *optionPicker;
NSMutableDictionary *studentInfoDic;
    NSMutableArray *grade;
    UIButton *myButton ;
    NSString *pickerSelectSubject;
    NSString *pickerSelectgrade;
}
@property (retain, nonatomic) IBOutlet UITextField *nameFiled;
@property (retain, nonatomic) IBOutlet UITextField *IDnameField;
@property (retain, nonatomic) IBOutlet UIPickerView *optionPicker;
@property (retain, nonatomic) IBOutlet UITextField *createSubject;
@property (retain, nonatomic) IBOutlet UITextField *createSubject_grade;
@property (retain, nonatomic) IBOutlet UIButton *commit;
@property (retain, nonatomic) NSString *pickerSelectSubject;
@property (retain, nonatomic) NSString *pickerSelectgrade;

@property (retain, nonatomic)NSMutableDictionary *studentInfoDic;
-(void)getStudentData:(NSMutableDictionary*) input_dic;

@end
