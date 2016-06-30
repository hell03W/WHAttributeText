//
//  WHAttributeText.m
//  WHAttributeText
//
//  Created by len on 15/10/21.
//  Copyright (c) 2015年 wandels. All rights reserved.
//

#import "WHText.h"
#import "WHTextAttribute.h"

@interface WHText ()

//@property (nonatomic, strong)NSMutableDictionary *whAttributeDictionary;

@end

@implementation WHText

#pragma mark - 创建对象

+ (id)textWithString:(NSString *)text
{
    return [[self alloc] initWithString:text];
}

+ (id)text;
{
    return [[self alloc] init];
}


#pragma mark - 一些其它方法
//1, 获取属性字符串 返回 NSMutableAttributedString 类型
     //调用这个方法之后才能获取size

+ (id)getTextWithString:(NSString *)text andAttribute:(void (^)(WHText *make))block
{
    WHText *attributeText = [WHText text];
    attributeText.string = text;
    block(attributeText);
    return [attributeText getText];
}

//2, 返回设置好属性和长宽的label
- (UILabel *)getLabel
{
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.attributedText = [self getText];
    label.frame = CGRectMake(0, 0, self.width, self.height);
    
    return label;
}
- (UILabel *)getLabelWithText:(NSString *)text andWidth:(float)width andAttribute:(void (^)(WHText *make))block
{
    block(self);
    self.string = text;
    self.width = width;
    return [self getLabel];
}
+ (UILabel *)getLabelWithText:(NSString *)text andAttribute:(void (^)(WHText *make))block
{
    return [WHText getLabelWithText:text andWidth:0 andAttribute:block];
}

+ (UILabel *)getLabelWithText:(NSString *)text andWidth:(float)width andAttribute:(void (^)(WHText *make))block
{
    WHText *att = [WHText text];
    block(att);
    att.string = text;
    att.width = width;
    return [att getLabel];
}


+ (id)getAttributeDictionary:(void (^)(WHText *make))block
{
    WHText *attributeText = [[WHText alloc] init];
    block(attributeText);
    return [attributeText getAttributeDictionary];
}

//5, 设置属性并返回字符串的长度
+ (NSInteger)getTextWidthString:(NSString *)text attribute:(void (^)(WHText *make))block
{
    UILabel *label = [WHText getLabelWithText:text andAttribute:block];
    label.frame = CGRectMake(0, 0, 0, 0);
    [label sizeToFit];
    return label.frame.size.width;
}


#pragma mark - set方法， 添加段落或者文字的属性


- (CGFloat)height
{
    [self getText];
    return _height;
}

- (CGFloat)width
{//如果设置label的宽度就按照设置的宽度，否则，按照屏幕宽度 - 40
    if (_width == 0.f) {
        return [[UIScreen mainScreen] bounds].size.width - 40;
    }
    return _width;
}

- (void)setSize:(CGSize)whSize
{
    _size = whSize;
    _width = whSize.width;
    _height = whSize.height;
}












@end

