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
    
    //1,创建一个对象,
    WHAttributeText *attributeText = [WHAttributeText attributeText];
    //2,赋值一个字符串
    attributeText.string = @"在北京时间3 月 10 日凌晨的苹果发布活动上，HBO 宣布推出与苹果独家合作的 HBO Now 服务，并播出了万众期待的第五季《权力的游戏》预告片。\n2015年3月11日，HBO 正式宣布了《权力的游戏》第五季将在全球同步播出的决定，通过 HBO 旗下的全球各个电视网播出.";
    //3,设置属性
    attributeText.whFontSize = 12.f;
//    attributeText.whFontColor = [UIColor redColor];
//    attributeText.whFontKern = @5;
//    attributeText.whFontUnderline = @1;
//    attributeText.whFontObliqueness = @0.5;
    
//    attributeText.whParaAlignment = NSTextAlignmentCenter;
//    attributeText.whParaLineSpacing = 10;
    
    attributeText.fontColor([UIColor purpleColor]).fontKern(@5).fontUnderline(@2).fontObliqueness(@0.5).and.paraHeadIndent(8).paraLineSpacing(10);
    //4,设置宽度
    attributeText.width = 200;
    //5,获取放着字符串的label  ,   并设置大小
    UILabel *label = [attributeText getAttributeLabel];
    [self.view addSubview:label];
    label.frame = CGRectMake(20, 20, attributeText.width, attributeText.height);
    label.backgroundColor = [UIColor lightGrayColor];
    
//    NSDictionary *dict = [WHAttributeText getAttributeDictionary:^(WHAttributeText *make) {
//        make.fontColor([UIColor redColor]).fontSize(14).paraHeadIndent(8).paraLineSpacing(20).paraSpacing(8).paraAlignment(NSTextAlignmentCenter);
//    }];
//    NSLog(@"%@", dict);
    
    
    WHAttributeText *attributeText1 = [WHAttributeText attributeText];
    attributeText1.string = @"在北京时间3 月 10 日凌晨的苹果发布活动上，HBO 宣布推出与苹果独家合作的 HBO Now 服务，并播出了万众期待的第五季《权力的游五季片。";
    attributeText1.fontSize(15).paraLineSpacing(5);
    attributeText1.width = [UIScreen mainScreen].bounds.size.width - 105;
    NSLog(@"height --- %f ---", attributeText1.height);
    UILabel *label1 = [attributeText1 getAttributeLabel];
    [self.view addSubview:label1];
    label1.frame = CGRectMake(20, 20, attributeText1.width, attributeText1.height);
    label1.backgroundColor = [UIColor redColor];
}


@end
