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
    
    for (int i = 0 ; i < 100 ; ++i)
        students[i] = [Student new];
    return self;
}

-(void)initData{
    database = [[DataBaseController alloc]init];
    StudentsDicValue = [NSMutableArray new];
    AllStudentsInfo = [NSMutableArray array];
    AllStudentsInfo = [database readStudentInfo];
    int type=0;
    student_count=0;
    for (NSString *info in AllStudentsInfo){
       
        switch(type%4){
            case 1:
               students[student_count].name = [NSString stringWithFormat:@"%@",info];
                [StudentsDicValue addObject:students[student_count].name];
                break;
            case 2:
               students[student_count]. ID = [NSString stringWithFormat:@"%@",info];
                [StudentsDicValue addObject:students[student_count].ID];
                break;
            case 3:
               students[student_count]. grade = [NSString stringWithFormat:@"%@",info];
                [StudentsDicValue addObject:students[student_count].grade];
                 [StudentsInfoDic setValue:StudentsDicValue forKey:students[student_count].subject];
                ++student_count;
                break;
            case 0:
                  
                StudentsDicValue = [[StudentsInfoDic objectForKey:info] mutableCopy];
                 students[student_count].subject = [NSString stringWithFormat:@"%@",info];
                break;
        }
        ++type;
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initData];
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
    
    return [[StudentsInfoDic allKeys] objectAtIndex:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return [[StudentsInfoDic allKeys] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return student_count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
   cell.textLabel.text = [NSString stringWithFormat:@"(%@)  ", [[[StudentsInfoDic allKeys] objectAtIndex:indexPath.section ] objectAtIndex:indexPath.row]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",students[indexPath.row].grade];
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
