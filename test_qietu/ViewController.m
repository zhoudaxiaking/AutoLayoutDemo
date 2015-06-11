//
//  ViewController.m
//  test_qietu
//
//  Created by zzMBP on 15/6/8.
//  Copyright (c) 2015年 mydemo. All rights reserved.
//

#import "ViewController.h"

#import "Masonry.h"

#define MAS_SHORTHAND

@interface ViewController ()
@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UILabel *topLabel;
@property (nonatomic, weak) UILabel *bottomLabel;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, weak) UIView *labelParentView;
//
@property (nonatomic, weak) UITextField *imageWidthTF;
@property (nonatomic, weak) UITextField *imageHeightTF;
@property (nonatomic, weak) UITextView *topTextView;
@property (nonatomic, weak) UITextView *bottomTextView;
@property (nonatomic, weak) UIButton *updateBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.backView = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor lightGrayColor];
        view;
    });
    
    [self.view addSubview:self.backView];

    
    UIView *labelParentView = [[UIView alloc] init];
    labelParentView.backgroundColor = [UIColor whiteColor];
    [self.backView addSubview:labelParentView];
    
    self.labelParentView = labelParentView;
    
    UILabel *topLabel = [[UILabel alloc] init];
    topLabel.numberOfLines = 0;
    topLabel.backgroundColor = [UIColor orangeColor];
    [self.labelParentView addSubview:topLabel];
    self.topLabel = topLabel;
    //
    UILabel *bottomLabel = [[UILabel alloc] init];
    bottomLabel.numberOfLines = 0;
    bottomLabel.backgroundColor = [UIColor greenColor];
    [self.labelParentView addSubview:bottomLabel];
    self.bottomLabel = bottomLabel;
    
    self.topLabel.text = @"交罚";
    self.bottomLabel.text = @"fjd律";
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pp.png"]];
    imageView.backgroundColor = [UIColor whiteColor];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.backView addSubview:imageView];
    self.imageView = imageView;
    
  
    
    [self.backView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(80);
        make.centerX.equalTo(self.view.mas_centerX);
        make.left.greaterThanOrEqualTo(self.view.mas_left).offset(10).priority(500);
        make.right.greaterThanOrEqualTo(self.view.mas_right).offset(-10).priority(500);
        make.width.equalTo(@(0)).with.priority(10);
        
        
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(150));
        make.height.equalTo(@(150));
        make.left.equalTo(self.backView.mas_left).offset(10);
        make.top.greaterThanOrEqualTo(self.backView.mas_top).offset(10);
        make.centerY.equalTo(self.backView.mas_centerY);
    }];
    
    [self.labelParentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView.mas_right).offset(10);
        
        make.right.equalTo(self.backView.mas_right).offset(-10);
   
        make.top.greaterThanOrEqualTo(self.backView.mas_top).offset(10);
        make.centerY.equalTo(self.backView.mas_centerY);
        make.width.equalTo(@(0)).with.priority(10);
    }];
    
    [self.topLabel setContentHuggingPriority:1000 forAxis:0];
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.labelParentView.mas_top).offset(10);
        make.left.equalTo(self.labelParentView.mas_left).offset(10);
        make.right.equalTo(self.labelParentView.mas_right).offset(-10).with.priority(750);
        
        
    }];
    
    [self.bottomLabel setContentHuggingPriority:1000 forAxis:0];
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topLabel.mas_bottom).offset(10);
        make.bottom.equalTo(self.labelParentView.mas_bottom).offset(-10);
        make.left.equalTo(self.labelParentView.mas_left).offset(10);
        make.right.equalTo(self.labelParentView.mas_right).offset(-10).priority(750);
    }];
 
    [self setButton];
}

- (void) setButton
{
    
    UITextField *imageWidthTF = [[UITextField alloc] init];
    imageWidthTF.backgroundColor = [UIColor whiteColor];
    imageWidthTF.placeholder = @"图片宽";
    [self.view addSubview:imageWidthTF];
    self.imageWidthTF = imageWidthTF;
    [self.imageWidthTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-150);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.width.equalTo(@(60));
        
    }];

    UITextField *imageHeightTF = [[UITextField alloc] init];
    imageHeightTF.backgroundColor = [UIColor whiteColor];
    imageHeightTF.placeholder = @"图片高";
    [self.view addSubview:imageHeightTF];
    self.imageHeightTF = imageHeightTF;
    [self.imageHeightTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.imageWidthTF.mas_top).offset(-10);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.width.equalTo(self.imageWidthTF);
        
    }];
    
    UITextView *bottomTextView = [[UITextView alloc] init];
    bottomTextView.text = @"第二个label的文字";
    [self.view addSubview:bottomTextView];
    self.bottomTextView = bottomTextView;
    
    [self.bottomTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
        make.right.equalTo(self.view.mas_right).offset(-100);
        make.width.equalTo(@(200));
        make.height.equalTo(@(100));
    }];
                                      
    
    
    UITextView *topTextView = [[UITextView alloc] init];
    topTextView.text = @"第一label的文字";
    [self.view addSubview:topTextView];
    self.topTextView = topTextView;
    [self.topTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottomTextView.mas_top).offset(-10);
        make.width.equalTo(@(200));
        make.height.equalTo(@(100));
        make.right.equalTo(self.view.mas_right).offset(-100);
                                      
    }];
    
    UIButton *updateBtn = [[UIButton alloc] init];
    [updateBtn addTarget:self action:@selector(ClickBtn) forControlEvents:UIControlEventTouchUpInside];
    [updateBtn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [updateBtn setTitle:@"update" forState:UIControlStateNormal];
    [self.view addSubview:updateBtn];
    self.updateBtn = updateBtn;
    
    [self.updateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-10);
        make.width.equalTo(@(100));
        make.height.equalTo(@(80));
    }];
}

- (void)ClickBtn
{
    self.topLabel.text = self.topTextView.text;
    self.bottomLabel.text = self.bottomTextView.text;
    CGFloat width = [self.imageWidthTF.text floatValue];
    CGFloat height = [self.imageHeightTF.text floatValue];
    
    [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width));
        make.height.equalTo(@(height));
    }];
    
    [self.view setNeedsUpdateConstraints];
    
    [self.view updateConstraintsIfNeeded];
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    NSLog(@"click me");
}



@end
