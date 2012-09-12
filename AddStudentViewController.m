//
//  AddStudentViewController.m
//  StudentSystem
//
//  Created by mini server on 12/9/12.
//
//

#import "AddStudentViewController.h"

@interface AddStudentViewController ()

@end

@implementation AddStudentViewController
@synthesize nameFiled;
@synthesize IDnameField;
@synthesize optionPicker;
@synthesize createSubject;
@synthesize createSubject_grade;
@synthesize commit;
@synthesize studentInfoDic;
@synthesize pickerSelectSubject;
@synthesize pickerSelectgrade;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)getStudentData:(NSMutableDictionary*)input_dic{
    studentInfoDic=input_dic;

}


-(BOOL) textFieldShouldReturn:(UITextField*) textField {
    [textField resignFirstResponder];
    return YES;
}
- (void) hideKeyboard {
   [nameFiled resignFirstResponder];
   [ IDnameField resignFirstResponder];
   [ optionPicker resignFirstResponder];
   [createSubject resignFirstResponder];
   [ createSubject_grade resignFirstResponder];
}

-(IBAction)clickHandler:(id)sender
{
    
    NSString *newSubject = nil ;
    NSString *newSubject_grade = nil;
    NSString *studentName = [NSString stringWithFormat:@"%@", [nameFiled text]];
    NSString *studentID = [NSString stringWithFormat:@"%@", [IDnameField text]];
if([[createSubject text] length] && [[createSubject text] length]){
    newSubject = [NSString stringWithFormat:@"%@", [createSubject text]];
    newSubject_grade = [NSString stringWithFormat:@"%@", [createSubject_grade text]];
        }
else {
    newSubject_grade = pickerSelectgrade;
    newSubject= pickerSelectSubject;

    }
    if (![studentName length]|| ![studentID length]|| [newSubject_grade length])
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"格式錯誤" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        return ;
    }
    DataBaseController *database = [DataBaseController new];
    [database SaveStudentSubject:newSubject andName:studentName StudentID:studentID Grade:newSubject_grade];
    [self.navigationController popViewControllerAnimated:YES];
  }


- (void)viewDidLoad
{
    [super viewDidLoad];
    grade= [NSMutableArray new];
    for (int i = 0 ;i <=100 ; ++i)
        [grade addObject:[NSString stringWithFormat:@"%d",i]];
    commit.userInteractionEnabled = YES;
    self.view.userInteractionEnabled = YES;
    createSubject.delegate = self;
    createSubject.returnKeyType = UIReturnKeyDone;
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    [commit addTarget:self action:@selector(clickHandler:) forControlEvents:UIControlEventTouchDown];
      
    optionPicker.frame = CGRectMake(40, 120, 240, 100);
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setNameFiled:nil];
    [self setIDnameField:nil];
    [self setOptionPicker:nil];
    [self setCreateSubject:nil];
    [self setCreateSubject_grade:nil];
    
    [self setCommit:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [nameFiled release];
    [IDnameField release];
    [optionPicker release];
    [createSubject release];
    [createSubject_grade release];
    [commit release];
    [super dealloc];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    return 2;
}


- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
   if (component ==0)
    return [[studentInfoDic allKeys] count];
   else
       return 100;
}


- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
   
    if (component==0){
         pickerSelectSubject = [[studentInfoDic allKeys] objectAtIndex:row];
         return [[studentInfoDic allKeys] objectAtIndex:row];
    }
    else  {
         pickerSelectgrade = [grade objectAtIndex:row];
       return [grade objectAtIndex:row];
    }
}


- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	    if(component ==0)
            pickerSelectSubject = [[studentInfoDic allKeys] objectAtIndex:row];
        else
            pickerSelectgrade = [grade objectAtIndex:row];
    NSLog(@"%@,%@",pickerSelectgrade,pickerSelectSubject);
}

@end
