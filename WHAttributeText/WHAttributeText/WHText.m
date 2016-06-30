//
//  WHAttributeText.m
//  WHAttributeText
//
//  Created by len on 15/10/21.
//  Copyright (c) 2015年 wandels. All rights reserved.
//

#import "WHText.h"

@interface WHText ()

@property (nonatomic, strong)NSMutableDictionary *whAttributeDictionary;

@end

@implementation WHText

#pragma mark - 创建对象
- (instancetype)init
{
    return [self initWithString:nil];
}

- (id)initWithString:(NSString *)text
{
    if (self = [super init]) {
        _whParagrahStyle = [[NSMutableParagraphStyle alloc] init];
        _whParagrahStyle.lineSpacing = 4;
        
        _whAttributeDictionary = [NSMutableDictionary dictionary];
        [_whAttributeDictionary setValue:[UIFont systemFontOfSize:13] forKey:NSFontAttributeName];
        [_whAttributeDictionary setValue:_whParagrahStyle forKey:NSParagraphStyleAttributeName];
        
        self.string = text;
    }
    return self;
}
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
- (id)getText
{
    //1，如果字符串为空，那么返回nil
    if (!_string) {
        return nil;
    }
    NSMutableAttributedString *whAttributeString = [[NSMutableAttributedString alloc] initWithString:_string];
    //3，给属性字符串设置属性
    [whAttributeString addAttributes:self.whAttributeDictionary range:NSMakeRange(0, _string.length)];
    
    //4,计算字典属性和文字所占的Label的长宽
    self.size = [_string boundingRectWithSize:CGSizeMake(self.width, MAXFLOAT)
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:self.whAttributeDictionary
                                          context:nil].size;//计算文字大小
    
    return whAttributeString;
}

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

//4, 获取属性字典
- (id)getAttributeDictionary
{
    return self.whAttributeDictionary;
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





// 设置文本的宽度和高度.
- (WHBlockFloat)textWidth
{
    return ^(CGFloat width){
        self.width = width;
        return self;
    };
}

- (WHBlockFloat)textHeight
{
    return ^(CGFloat height){
        self.height = height;
        return self;
    };
}

@end












