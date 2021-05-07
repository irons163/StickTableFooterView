//
//  ViewController.m
//  StickTableFooterView
//
//  Created by Phil on 2021/5/7.
//

#import "ViewController.h"
#import "ViewWithOutboundsButtons.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    
    NSInteger innerViewHeight = 80;
    NSInteger settingsButtonHeight = 40;
    
    UIView *innerView = [[ViewWithOutboundsButtons alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, innerViewHeight)];
    innerView.backgroundColor = UIColor.yellowColor;
    
    self.tableView.tableFooterView = [[ViewWithOutboundsButtons alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, innerViewHeight)];
    self.tableView.tableFooterView.backgroundColor = UIColor.redColor;
    
    UILabel *footerViewTitle = [[UILabel alloc] init];
    footerViewTitle.translatesAutoresizingMaskIntoConstraints = false;
    footerViewTitle.text = @"The Footer View";
    [innerView addSubview:footerViewTitle];
    
    [footerViewTitle.topAnchor constraintEqualToAnchor:footerViewTitle.superview.topAnchor].active = YES;
    [footerViewTitle.bottomAnchor constraintEqualToAnchor:footerViewTitle.superview.bottomAnchor].active = YES;
    [footerViewTitle.leftAnchor constraintEqualToAnchor:footerViewTitle.superview.leftAnchor].active = YES;
    [footerViewTitle.rightAnchor constraintEqualToAnchor:footerViewTitle.superview.rightAnchor].active = YES;
    
    UIButton *settingsButton = [UIButton buttonWithType:UIButtonTypeSystem];
    settingsButton.backgroundColor = UIColor.blueColor;
    [settingsButton setTitle:@"Setting" forState:UIControlStateNormal];
    [settingsButton.titleLabel setFont:[UIFont boldSystemFontOfSize:15.0f]];
    [settingsButton setBackgroundColor:[UIColor clearColor]];
    [settingsButton addTarget:self action:@selector(didClickSettingsButton) forControlEvents:UIControlEventTouchUpInside];
    
    [innerView addSubview:settingsButton];
    
    settingsButton.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint constraintWithItem:settingsButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:settingsButton.superview attribute:NSLayoutAttributeRight multiplier:1 constant:-28].active = YES;
    [NSLayoutConstraint constraintWithItem:settingsButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:settingsButton.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:settingsButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:settingsButtonHeight].active = YES;
    
    [self.tableView.tableFooterView addSubview:innerView];
    
    innerView.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint constraintWithItem:innerView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:innerView.superview attribute:NSLayoutAttributeRight multiplier:1 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:innerView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:innerView.superview attribute:NSLayoutAttributeLeft multiplier:1 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:innerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:innerView.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:innerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.tableView.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:innerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:innerViewHeight].active = YES;
}

- (void)didClickSettingsButton {
    NSLog(@"didClickSettingsButton");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [NSString stringWithFormat:@"Row %ld", indexPath.row];
    return cell;
}

@end
