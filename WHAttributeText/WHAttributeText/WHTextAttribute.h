//
//  WHTextAttribute.h
//  WHAttributeText
//
//  Created by  www.6dao.cc on 16/6/30.
//  Copyright © 2016年 wandels. All rights reserved.
//

#import <UIKit/UIKit.h>


@class WHTextAttribute;

typedef  WHTextAttribute *(^WHBlockFloat)(CGFloat);
typedef  WHTextAttribute *(^WHBlockColor)(UIColor *);
typedef  WHTextAttribute *(^WHBlockNumber)(NSNumber *);


@interface WHTextAttribute : NSObject

// 存放字符串相关各种属性.
@property (nonatomic, strong, readonly) NSMutableDictionary *attributeDict;


//文字属性
//1,文字大小
@property (nonatomic, assign)CGFloat whFontSize;
//2，字体颜色
@property (nonatomic, strong)UIColor *whFontColor;
//3,文字所在区域背景颜色
@property (nonatomic, strong)UIColor *whFontBackgroundColor;
//4，字符间距
@property (nonatomic, strong)NSNumber *whFontKern;
//5，设置下划线
@property (nonatomic, strong)NSNumber *whFontUnderline;
//6，设置下划线颜色
@property (nonatomic, strong)UIColor *whFontUnderlineColor;
//7，设置字体倾斜度  ，负值向左，正值向右
@property (nonatomic, strong)NSNumber *whFontObliqueness;



//段落属性
//1，设置段落属性

//2,行间距
@property (nonatomic, assign)CGFloat whParaLineSpacing;
//3,段间距
@property (nonatomic, assign)CGFloat whParaSpacing;
//4,对齐方式
@property (nonatomic, readwrite)NSTextAlignment whParaAlignment;
//5,首行缩进
@property(nonatomic, readwrite) CGFloat whParaFirstLineHeadIndent;
//6,最小行高
@property(nonatomic, readwrite) CGFloat whParaMinimumLineHeight;
//7,最大行高
@property(nonatomic, readwrite) CGFloat whParaMaximumLineHeight;
//8,除首行之外其他行缩进
@property(nonatomic, readwrite) CGFloat whParaHeadIndent;



//支持链式编程 链式编程 需要借助block来实现
- (WHBlockFloat)fontSize;
- (WHBlockColor)fontColor;
- (WHBlockColor)fontBackgroundColor;
- (WHBlockNumber)fontKern;
- (WHBlockNumber)fontUnderline;
- (WHBlockColor)fontUnderlineColor;
- (WHBlockNumber)fontObliqueness;

- (WHBlockFloat)paraLineSpacing;
- (WHBlockFloat)paraSpacing;
- (WHTextAttribute *(^)(NSTextAlignment))paraAlignment;
- (WHBlockFloat)paraFirstLineHeadIndent;
- (WHBlockFloat)paraMinimumLineHeight;
- (WHBlockFloat)paraMaximumLineHeight;
- (WHBlockFloat)paraHeadIndent;

//设置长宽,主要用到设置label的宽度,根据设置的宽度返回label的宽度.
//- (WHBlockFloat)textWidth;
//- (WHBlockFloat)textHeight;


- (WHTextAttribute *)and;
- (WHTextAttribute *)with;

@end
