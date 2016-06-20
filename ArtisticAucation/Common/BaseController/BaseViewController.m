//
//  BaseViewController.m
//  ArtisticAucation
//
//  Created by xieran on 15/9/11.
//  Copyright (c) 2015年 xieran. All rights reserved.
//

#import "BaseViewController.h"
#import "MBProgressHUD.h"

#define LoginAlertTag 0x1000
#define title_font  [UIFont systemFontOfSize:16.0f]
#define DMsgWidth 260.0f
#define DErrTextFont [UIFont systemFontOfSize:15.0f]
#define DErrTextHeight 19.0f

@interface BaseViewController ()<UIAlertViewDelegate>

@property(nonatomic,retain)UIBarButtonItem *backArrow;

@end

@implementation BaseViewController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:ItemPreferenceStateChanged object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIBarButtonItem *navSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    navSpacer.width = -5;
    
    self.navigationItem.leftBarButtonItems = @[navSpacer,self.backArrow];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(itemPreferenceStateChanged:) name:ItemPreferenceStateChanged object:nil];
}

-(void)itemPreferenceStateChanged:(NSNotification *)notice
{
    //subclass custom
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == LoginAlertTag && buttonIndex == 1) {
        [self.tabBarController.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)setNavTitle:(NSString *)title
{
    UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180, 44)];
    titleLb.backgroundColor = [UIColor clearColor];
    titleLb.font = [UIFont systemFontOfSize:18.0];
    titleLb.textColor = [UIColor blackColor];
    titleLb.textAlignment = TextAlignmentCenter;
    titleLb.text = title;
    [self setCustomTitleViewWithImage:nil orView:titleLb WithFrame:CGRectZero];
}

- (void)setCustomTitleViewWithImage:(UIImage *)image orView:(UIView *)view WithFrame:(CGRect)frame
{
    if (image) {
        UIImageView *v = [[UIImageView alloc] initWithFrame:frame];
        v.image = image;
        self.navigationItem.titleView = v;
    }
    else {
        self.navigationItem.titleView = view;
    }
}

- (void)setRightItemEnabled:(BOOL)enabled
{
    self.navigationItem.rightBarButtonItem.customButton.enabled = enabled;
}

- (void)setLeftButtonWithNormalImage:(UIImage *)image HighlightedImage:(UIImage *)hImage target:(id)target selector:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:hImage forState:UIControlStateHighlighted];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)setLeftButtonTitle:(NSString *)title image:(UIImage *)image target:(id)target selector:(SEL)selector {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    if (title && [title length] > 0) {
        [button setTitle:title forState:UIControlStateNormal];
        [button.titleLabel setFont:title_font];
    }
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)setRightButtonImage:(UIImage *)image target:(id)target selector:(SEL)selector
{
    if (image) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:143.0/255.0 green:177.0/255.0 blue:204.0/255.0 alpha:1.0] forState:UIControlStateDisabled];
        [button.titleLabel setFont:title_font];
        //        [button.titleLabel setShadowColor:[UIColor blackColor]];
        //        [button.titleLabel setShadowOffset:CGSizeMake(0, -1)];
        //        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.rightBarButtonItem = backItem;
    }
    else {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)setLeftButtonTitle:(NSString *)title font:(UIFont *)f target:(id)target selector:(SEL)selector {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 40, 30)];
    if (title && [title length] > 0) {
        [button setTitle:title forState:UIControlStateNormal];
        [button.titleLabel setFont:f];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    }
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)setRightButtonTitle:(NSString *)title font:(UIFont *)f target:(id)target selector:(SEL)selector disabled:(BOOL)disabled
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 45, 30)];
    if (title && [title length] > 0) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255.0/255.0 alpha:0.6] forState:UIControlStateHighlighted];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -15);
    }
    button.enabled = disabled;
    button.titleLabel.font = f;
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = backItem;
}

- (void)setRightButtonTitle:(NSString *)title font:(UIFont *)f target:(id)target selector:(SEL)selector {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 45, 30)];
    if (title && [title length] > 0) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255.0/255.0 alpha:0.6] forState:UIControlStateHighlighted];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -15);
    }
    button.titleLabel.font = f;
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = backItem;
}

// 内部方法，global决定是贴在view上还是window上
- (void)displayErrorHUDWithText:(NSString *)error global:(BOOL)global
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:global?self.view.window:self.view
                                              animated:YES];
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeCustomView;
    //    hud.labelText = error;
    NSString *msg2Show = [NSString stringWithString:error];
    CGSize msgSize = [msg2Show sizeWithFont:DErrTextFont
                          constrainedToSize:CGSizeMake(DMsgWidth, MAXFLOAT)
                              lineBreakMode:LineBreakByWordWrapping];
    
    
    int lines = (int)ceilf(msgSize.height / DErrTextHeight);
    
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 0.0f, msgSize.width, DErrTextHeight * lines)];
    [textLabel setTextAlignment:TextAlignmentCenter];
    [textLabel setLineBreakMode:LineBreakByWordWrapping];
    [textLabel setText:msg2Show];
    [textLabel setFont:DErrTextFont];
    [textLabel setTextColor:[UIColor whiteColor]];
    [textLabel setBackgroundColor:[UIColor clearColor]];
    [textLabel setNumberOfLines:lines];
    hud.customView = textLabel;
    
    hud.margin = 20.f;
    //    hud.yOffset = 0.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2.0f];
}


- (void)displayErrorHUDWithText:(NSString *)error
{
    [self displayErrorHUDWithText:error global:NO];
}

// 内部方法，global决定是贴在view上还是window上
- (void)showGlobalLodingHUDWithText:(NSString *)text global:(BOOL)global
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:global?self.view.window:self.view animated:YES];
    hud.labelText = text;
    hud.labelFont = DErrTextFont;
    hud.margin = 20.0f;
}

- (void)showLoadingHUDWithText:(NSString *)text {
    [self showGlobalLodingHUDWithText:text global:NO];
}


- (void)hideHUD {
    [MBProgressHUD hideHUDForView:self.view animated:NO];
    [MBProgressHUD hideAllHUDsForView:self.view.window animated:NO];
}

- (void)actionBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(UIBarButtonItem *)backArrow
{
    if (!_backArrow) {
        UIImage *image = [UIImage imageNamed:@"left_arrow_nor"];
        UIImage *selectedImage = [UIImage imageNamed:@"left_arrow_sel"];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        [button setImage:image forState:UIControlStateNormal];
        [button setImage:selectedImage forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
        
        _backArrow = [[UIBarButtonItem alloc]initWithCustomView:button];
    }
    return _backArrow;
}




@end
