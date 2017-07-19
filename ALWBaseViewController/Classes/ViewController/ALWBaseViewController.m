//
//  ALWBaseViewController.m
//  Pods
//
//  Created by lisong on 2017/7/19.
//  Copyright © 2017年 alongway. All rights reserved.
//

#import "ALWBaseViewController.h"

@interface ALWBaseViewController ()

@end

@implementation ALWBaseViewController

#pragma mark - Getter/Setter
- (void)setWillHideNavigationBar:(BOOL)willHideNavigationBar
{
    //willHideNavigationBar若为YES，将self.view上的scrollView的contentOffset交由自己控制（系统默认偏移到状态栏或者导航栏下边线）
    self.automaticallyAdjustsScrollViewInsets = !willHideNavigationBar;
    
    _willHideNavigationBar = willHideNavigationBar;
}

#pragma mark - Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.pageName = NSStringFromClass([self class]);
    self.willHideStatusBar = NO;
    self.isStatusBarModeBasedOnUIViewController = YES;
    self.statusBarStyle = UIStatusBarStyleDefault;
    self.willHideNavigationBar = NO;
    
    if (self.navigationController) {
        //当存在导航栏时候，解决ios7.0以上系统的self.view的originY起始位置在屏幕顶部的问题
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self updateStatusBar];
    
    if (self.navigationController) {
        [self.navigationController setNavigationBarHidden:self.willHideNavigationBar animated:animated];
    }
}

#pragma mark - [状态栏控制方法
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return self.statusBarStyle;
}

- (BOOL)prefersStatusBarHidden
{
    return self.willHideStatusBar;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return UIStatusBarAnimationFade;
}

- (void)updateStatusBar
{
    if (self.isStatusBarModeBasedOnUIViewController) {
        [self setNeedsStatusBarAppearanceUpdate];
    }else{
        [[UIApplication sharedApplication] setStatusBarHidden:self.willHideStatusBar withAnimation:UIStatusBarAnimationFade];
        [[UIApplication sharedApplication] setStatusBarStyle:self.statusBarStyle];
    }
}
#pragma mark - ]状态栏控制方法

@end
