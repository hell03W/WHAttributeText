//
//  ViewController.m
//  WHAttributeText
//
//  Created by len on 15/10/21.
//  Copyright (c) 2015年 wandels. All rights reserved.
//

#import "ViewController.h"
#import "WHAttributeText.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    
    //测试代码
    NSString *str = @"阿基里斯那是看你老公看见了那是的高科技那公司的空间里那个谁看见了就爱点谁看见了就爱点附近";
    //1.1 测试返回属性字符串
    WHText *att = [WHText text];
    
    att.fontSize(15).fontColor([UIColor redColor]).fontObliqueness(@0.5);
    att.string = @"ans阿基里斯那是看你老公看见了那是的高科技那公司的空间里那个谁看见了就爱点谁看见了就爱点附近";
    
    UILabel *lab1 = [[UILabel alloc] init];
    [self.view addSubview:lab1];
    lab1.attributedText = [att getText];
    lab1.frame = CGRectMake(20, 350, 300, 100);
    lab1.numberOfLines = 0;
    
    //1.2 测试返回属性字符串
    NSMutableAttributedString *attString = [WHText getTextWithString:str andAttribute:^(WHText *make) {
        make.fontSize(15).fontColor([UIColor blueColor]).fontObliqueness(@0.5);
    }];
    
//    UILabel *lab2 = [[UILabel alloc] init];
//    [self.view addSubview:lab2];
//    lab2.attributedText = attString;
//    lab2.frame = CGRectMake(20, 450, 300, 100);
//    lab2.numberOfLines = 0;
    
    //2.1 实例方法 获取属性字典
    WHText *whText = [WHText text];
    whText.fontSize(20).fontColor([UIColor redColor]).paraAlignment(NSTextAlignmentCenter);
    NSDictionary *dict = [whText getAttributeDictionary];
//    NSLog(@"--- %@ ---", dict);
    
    //2.2 类方法 获取属性字典
    NSDictionary *dict2 = [WHText getAttributeDictionary:^(WHText *make) {
        make.fontSize(20).fontColor([UIColor redColor]).paraAlignment(NSTextAlignmentCenter);
    }];
    NSLog(@"--- %@ ---", dict2);
    
    //3.1 获取放着属性字符串的label
    WHText *whText1 = [WHText text];
    whText1.fontSize(20).fontColor([UIColor orangeColor]).paraAlignment(NSTextAlignmentCenter);
    whText1.string = @"阿基里斯那是看你老公看见了那是的高科技那公司的空间里那 个谁看见了就爱点谁看见了就爱点附近";
    whText1.textWidth(200);
    whText1.width = 200;
    UILabel *lab3 = [whText1 getLabel];
//    [self.view addSubview:lab3];
    
    
    //3.2 通过类方法获取放着属性字符串的label
    UILabel *lab4 = [WHText getLabelWithText:str andWidth:200 andAttribute:^(WHText *make) {
        make.fontSize(10).fontColor([UIColor orangeColor]).paraAlignment(NSTextAlignmentCenter);
    }];
    [self.view addSubview:lab4];
    
    
    
    
    
    
    //其它方法
    
    NSMutableAttributedString *attriString = [str getSpecialTextWithDecollator:@"我" andLeftAttribute:^(WHText *make) {
        make.fontSize(10).fontColor([UIColor orangeColor]).paraAlignment(NSTextAlignmentLeft);
    } andRightAttribute:^(WHText *make) {
        make.fontSize(15).fontColor([UIColor blueColor]).paraAlignment(NSTextAlignmentLeft);
    }];
    
    UILabel *lab2 = [[UILabel alloc] init];
    [self.view addSubview:lab2];
    lab2.attributedText = attriString;
    lab2.frame = CGRectMake(20, 450, 300, 100);
    lab2.numberOfLines = 0;
    
    
    
}


@end















