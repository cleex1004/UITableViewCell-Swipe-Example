//
//  ViewController.m
//  Lightning-Talk
//
//  Created by Christina Lee on 5/10/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) NSArray<Person *> *cohort;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cohort = [[NSArray<Person *> alloc]init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 50;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    Person* person1 = [[Person alloc]init];
    person1.name = @"Alex Cahn";
    person1.CF = @"student";
    
    Person* person2 = [[Person alloc]init];
    person2.name = @"Brandon Little";
    person2.CF = @"student";
    
    Person* person3 = [[Person alloc]init];
    person3.name = @"Christina Lee";
    person3.CF = @"student";
    
    Person* person4 = [[Person alloc]init];
    person4.name = @"David Cole";
    person4.CF = @"student";
    
    Person* person5 = [[Person alloc]init];
    person5.name = @"Eve Denison";
    person5.CF = @"student";
    
    self.cohort = @[person1, person2, person3, person4, person5];

    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cohort count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.cohort[indexPath.row].name;
    cell.detailTextLabel.text = self.cohort[indexPath.row].CF;
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewRowAction *gradAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"GRAD" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {

        self.cohort[indexPath.row].CF = @"graduate";
        [self.tableView reloadData];

    }];

    gradAction.backgroundColor = [UIColor colorWithRed:1.00 green:0.00 blue:0.50 alpha:1.0];



    UITableViewRowAction *employedAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"EMPLOYED" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
    
        self.cohort[indexPath.row].CF = @"EMPLOYED!";
        [self.tableView reloadData];
    
    }];
    
    employedAction.backgroundColor = [UIColor colorWithRed:0.00 green:0.90 blue:0.93 alpha:1.0];
    
    return @[employedAction, gradAction];
}

@end


//
//-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    UITableViewRowAction *gradAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"GRAD" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//
//        self.cohort[indexPath.row].CF = @"graduate";
//        [self.tableView reloadData];
//
//    }];
//
//    gradAction.backgroundColor = [UIColor colorWithRed:1.00 green:0.00 blue:0.50 alpha:1.0];
//
//
//
//    return @[gradAction];
//}


//UITableViewRowAction *employedAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"EMPLOYED" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//    
//    self.cohort[indexPath.row].CF = @"EMPLOYED!";
//    [self.tableView reloadData];
//    
//}];
//
//employedAction.backgroundColor = [UIColor colorWithRed:0.00 green:0.90 blue:0.93 alpha:1.0];
//
//return @[gradAction, employedAction];















