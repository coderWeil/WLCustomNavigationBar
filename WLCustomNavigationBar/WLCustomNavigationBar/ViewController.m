//
//  ViewController.m
//  WLCustomNavigationBar
//
//  Created by weil on 2019/7/3.
//  Copyright © 2019 AllYoga. All rights reserved.
//

#import "ViewController.h"
#import "Core/WLNavigationBar.h"

@interface ViewController ()
@property (nonatomic, strong) WLNavigationBar *navBar1;
@property (nonatomic, strong) WLNavigationBar *navBar2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupNavBar1];
    [self _setupNavBar2];
}

- (void) _setupNavBar1
{
    self.navBar1 = [[WLNavigationBar alloc] init];
    UIButton *leftItem1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftItem1 setTitle:@"leftItem1" forState:UIControlStateNormal];
    [leftItem1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    leftItem1.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.navBar1 wl_addLeftItem:leftItem1];
    
    UIButton *rightItem1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightItem1 setTitle:@"rightItem1" forState:UIControlStateNormal];
    [rightItem1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightItem1.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.navBar1 wl_addRightItem:rightItem1];
    
    UIButton *titleItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [titleItem setTitle:@"titleItem" forState:UIControlStateNormal];
    [titleItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    titleItem.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.navBar1 wl_setTitleItem:titleItem];
    
    [self.navBar1 wl_setBackgroundColor:[[UIColor lightGrayColor] colorWithAlphaComponent:1.0]];
    self.navBar1.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    [self.navBar1 wl_setMargin:15];
    [self.navBar1 wl_setItemSpace:10];
    [self.navBar1 wl_reload];
    [self.view addSubview:self.navBar1];
}
- (void) _setupNavBar2
{
    
}

@end
