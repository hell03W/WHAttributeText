//
//  WHText.h
//  WHText
//
//  Created by len on 15/10/21.
//  Copyright (c) 2015年 wandels. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface WHText : NSObject

//0, label 的宽度，width 设置label的宽度;   height得到label的高度
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
//1, 要给设置属性的 字符串
@property (nonatomic, strong)NSString *string;
//2, 放文字的Label的size，可以设置，也可以获取
@property (nonatomic, assign)CGSize size;

/*
 属性字符串   属性字典   label
 */
//其它方法

//1, 创建对象
- (id)initWithString:(NSString *)text;

+ (id)text;
+ (id)textWithString:(NSString *)text;

//2，返回 属性字符串
- (id)getText;
+ (id)getTextWithString:(NSString *)text andAttribute:(void (^)(WHText *make))block;

//3，获取一个放着属性字符串的label
- (UILabel *)getLabel;
- (UILabel *)getLabelWithText:(NSString *)text andWidth:(float)width andAttribute:(void (^)(WHText *make))block;
+ (UILabel *)getLabelWithText:(NSString *)text andAttribute:(void (^)(WHText *make))block;
+ (UILabel *)getLabelWithText:(NSString *)text andWidth:(float)width andAttribute:(void (^)(WHText *make))block;

//4, 返回属性字典
- (id)getAttributeDictionary;
+ (id)getAttributeDictionary:(void (^)(WHText *make))block;


//5, 根据字符串和属性,获取text的宽度
+ (NSInteger)getTextWidthString:(NSString *)text attribute:(void (^)(WHText *make))block;














/*NSShadow用法：
 NSShadow *shadow = [[NSShadow alloc] init];
 shadow.shadowColor = [UIColor redColor]; //设置阴影的颜色
 shadow.shadowOffset = CGSizeMake(2, 1);//设置阴影的偏移方向，x：左右，负左正右；y：上下，负上正下
 shadow.shadowBlurRadius = 5;  
 */
// 详细属性见：http://blog.csdn.net/weidfyr/article/details/48316775

@end
/*
使用说明：
 1，必须调用第二个方法之后，才能获取label的高度
 2，可以一个一个的设置属性，同时支持链式编程，链式的设置属性
 */







