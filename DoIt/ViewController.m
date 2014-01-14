//
//  ViewController.m
//  DoIt
//
//  Created by John Malloy on 1/13/14.
//  Copyright (c) 2014 Big Red INC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITableView *myTableView;
    NSMutableArray *items;
    
    __weak IBOutlet UIButton *edit;
    __weak IBOutlet UITextField *myTextField;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    items = [NSMutableArray arrayWithObjects:@"One",@"Two",@"Three",nil];
	// Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return items.count;
}

- (IBAction)onAddButtonPressed:(id)sender
{
    [items addObject:myTextField.text];
    
    myTextField.text = @"";
    
    [myTableView reloadData];
  
    
    
}
- (IBAction)onEditButtonPressed:(UIButton *)editButton
    {
//    if (self.editing)
//    {
//        editButton.titleLabel=@"Edit";
//        [super setEditing:NO animated:YES];
//    } else    {
//        editButton.titleLabel=@"Done";
//        [super setEditing:YES animated:NO];
//   }
//    
    //self.editButtonItem.title = @"Done";

//    id text = editButton.titleLabel.text;
    
    if ([edit.titleLabel.text  isEqualToString:@"Edit"]) {
        [edit setTitle:@"Done" forState:UIControlStateNormal];
    } else {
        [edit setTitle:@"Edit" forState:UIControlStateNormal];
    }

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[edit titleForState:UIControlStateNormal] isEqualToString:@"Edit"])
    {
        [ tableView cellForRowAtIndexPath:indexPath].textLabel.textColor = [UIColor greenColor];
        [myTableView reloadData];
    } else {
                [items removeObjectAtIndex:indexPath.row];
        
                [myTableView reloadData];
    }
}




-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"myReuseIdentifier"];
    cell.textLabel.text = [items objectAtIndex:indexPath.row];
    
    
    cell.textLabel.textColor = [UIColor yellowColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:45];
    cell.backgroundColor = [UIColor blueColor];
    
    return cell;
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
