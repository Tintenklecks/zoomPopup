//
//  ViewController.m
//  TESTZOOMOUT
//
//  Created by Ingo Böhme on 24.12.13.
//  Copyright (c) 2013 AMOS. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

#import "zoomPopup.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showTableView:(id)sender {
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(50, 50, 300, 200) style:UITableViewStyleGrouped];
    table.dataSource=self;
    
    [zoomPopup initWithMainview:self.view andStartRect:_segmentedControl.frame];
    [zoomPopup showPopup:table];
    
}



- (IBAction)showImage:(id)sender {
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myAn"]];
    
    zoomPopup *popup = [[zoomPopup alloc] initWithMainview:self.view andStartRect:_segmentedControl.frame];
    [popup setBlurRadius:10];
    [popup showPopup:image];
    
}


// *************************************************************
#pragma mark -
#pragma mark  TableView DataSource Protocol
// *************************************************************

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
	cell.textLabel.text = [NSString stringWithFormat: @"Zeile %li", (long)indexPath.row];
    return cell;
    
}



@end
