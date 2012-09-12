//
//  InfoTableViewController.m
//  StudentSystem
//
//  Created by MAC R on 12/9/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "InfoTableViewController.h"

@interface InfoTableViewController ()

@end

@implementation InfoTableViewController
@synthesize database;
@synthesize AllStudentsInfo;
@synthesize StudentsInfoDic;
@synthesize StudentsDicValue;
bool isSectionNumChange=false;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)init{
    database = [DataBaseController new];
    StudentsInfoDic = [NSMutableDictionary new];
    database = [[DataBaseController alloc]init];
    StudentsDicValue = [NSMutableArray new];
    AllStudentsInfo = [NSMutableArray new];
    AllStudentsInfo = [database readStudentInfo];
    NSLog(@"%@",AllStudentsInfo);
    for (int i = 0 ; i < 100 ; ++i)
        students[i] = [Student new];
    return self;
}

-(void)initData{
   int type=0;
    student_count=0;
    AllStudentsInfo = [database readStudentInfo];
    [StudentsInfoDic removeAllObjects];
    for (NSString *info in AllStudentsInfo){
       
        switch(type%4){
            case 1:
               students[student_count].name = [NSString stringWithFormat:@"%@",info];
               // [StudentsDicValue addObject:students[student_count].name];
                break;
            case 2:
               students[student_count]. ID = [NSString stringWithFormat:@"%@",info];
               // [StudentsDicValue addObject:students[student_count].ID];
                break;
            case 3:
               students[student_count]. grade = [NSString stringWithFormat:@"%@",info];
                [StudentsDicValue addObject:students[student_count]];
                 [StudentsInfoDic setValue:StudentsDicValue forKey:students[student_count].subject];
                ++student_count;
                break;
            case 0:
                  
                StudentsDicValue = [[StudentsInfoDic objectForKey:info] mutableCopy];
                if (!StudentsDicValue) StudentsDicValue = [NSMutableArray new];
                 students[student_count].subject = [NSString stringWithFormat:@"%@",info];
                break;
        }
        ++type;
    }
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [database removeAStudentWithSubject:[[StudentsInfoDic allKeys] objectAtIndex:indexPath.section] andName:[[[StudentsInfoDic objectForKey: [[StudentsInfoDic allKeys] objectAtIndex:indexPath.section ]] objectAtIndex: indexPath.row] name]];
   [tableView beginUpdates];
   
    [self initData];
  
    NSLog(@"%@",[NSArray arrayWithObject:indexPath]);
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
   // [tableView reloadData];

    [self.tableView endUpdates];
   
        
    
}
-(void)addStudentItem {
    AddStudentViewController *addStudent = [AddStudentViewController new];
    [addStudent getStudentData:StudentsInfoDic];
    addStudent.title = @"新增學生資料";
    [self.navigationController pushViewController:addStudent animated:YES];
}

-(void)deleteItem{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    if (self.tableView.editing)
        [self.navigationItem.rightBarButtonItem setTitle:@"Done"];
    else [self.navigationItem.rightBarButtonItem setTitle:@"Delete"];

}

-(void)viewWillAppear:(BOOL)animated{
    [self initData];
    [self.tableView reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //[DataBaseController EraseAll];
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"刪除" style:UIBarButtonItemStyleBordered target:self action:@selector(deleteItem)];
    [self.navigationItem setRightBarButtonItem:editButton];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addStudentItem)];
    [self.navigationItem setLeftBarButtonItem:addButton];
   
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source
-(NSString* )tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSLog(@"section title : %@",[[StudentsInfoDic allKeys] objectAtIndex:section]);
    return [[StudentsInfoDic allKeys] objectAtIndex:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    
    if(isSectionNumChange)
    {
        NSLog(@"section num : %i",[[StudentsInfoDic allKeys] count]-1);
        isSectionNumChange = true;
        return [[StudentsInfoDic allKeys] count]-1;
    }
    else {
         NSLog(@"section num : %i",[[StudentsInfoDic allKeys] count]);
        return [[StudentsInfoDic allKeys] count];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSLog(@"in section %i row num =   %i",section,[[StudentsInfoDic objectForKey: [[StudentsInfoDic allKeys] objectAtIndex:section]] count]);
    return [[StudentsInfoDic objectForKey: [[StudentsInfoDic allKeys] objectAtIndex:section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    NSString *stringInLebelText =  [NSString stringWithFormat:@"(%@)%@" ,[[[StudentsInfoDic objectForKey: [[StudentsInfoDic allKeys] objectAtIndex:indexPath.section ]] objectAtIndex: indexPath.row] ID],[[[StudentsInfoDic objectForKey: [[StudentsInfoDic allKeys] objectAtIndex:indexPath.section ]] objectAtIndex: indexPath.row] name]];
    cell.textLabel.text = stringInLebelText;
    cell.detailTextLabel.text = [[[StudentsInfoDic objectForKey: [[StudentsInfoDic allKeys] objectAtIndex:indexPath.section ]] objectAtIndex: indexPath.row] grade];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20]; 
    cell.detailTextLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];   
    if ([cell.detailTextLabel.text intValue]<60) cell.detailTextLabel.textColor = [UIColor redColor];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
