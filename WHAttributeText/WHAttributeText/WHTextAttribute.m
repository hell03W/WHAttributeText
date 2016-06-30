//
//  WHTextAttribute.m
//  WHAttributeText
//
//  Created by  www.6dao.cc on 16/6/30.
//  Copyright © 2016年 wandels. All rights reserved.
//

#import "WHTextAttribute.h"

@interface WHTextAttribute ()

@property (nonatomic, strong, readwrite) NSMutableParagraphStyle *paraStyle;

@end

@implementation WHTextAttribute

- (instancetype)init {
    if (self = [super init]) {
        
        // 初始化进行基本的设置, 否则会导致各种错误...
        _paraStyle = [[NSMutableParagraphStyle alloc] init];
        _paraStyle.lineSpacing = 1;  //默认lineSpace = 4
        
        _attributeDict = [NSMutableDictionary dictionary];
        [_attributeDict setValue:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName]; //默认字体大小14,
        [_attributeDict setValue:_paraStyle forKey:NSParagraphStyleAttributeName];
    }
    return self;
}


//各个属性的set方法
- (void)setWhFontSize:(CGFloat)whFontSize
{
    _whFontSize = whFontSize;
    [self addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:_whFontSize]];
}
- (void)setWhFontColor:(UIColor *)whFontColor
{
    _whFontColor = whFontColor;
    [self addAttribute:NSForegroundColorAttributeName value:_whFontColor];
}
- (void)setWhFontBackgroundColor:(UIColor *)whFontBackgroundColor
{
    _whFontBackgroundColor = whFontBackgroundColor;
    [self addAttribute:NSBackgroundColorAttributeName value:_whFontBackgroundColor];
}
- (void)setWhFontKern:(NSNumber *)whFontKern
{
    _whFontKern = whFontKern;
    [self addAttribute:NSKernAttributeName value:_whFontKern];
}
- (void)setWhFontUnderline:(NSNumber *)whFontUnderline
{
    _whFontUnderline = whFontUnderline;
    [self addAttribute:NSUnderlineStyleAttributeName value:_whFontUnderline];
}
- (void)setWhFontUnderlineColor:(UIColor *)whFontUnderlineColor
{
    _whFontUnderlineColor = whFontUnderlineColor;
    [self addAttribute:NSUnderlineColorAttributeName value:_whFontUnderlineColor];
}
- (void)setWhFontObliqueness:(NSNumber *)whFontObliqueness
{
    _whFontObliqueness = whFontObliqueness;
    [self addAttribute:NSObliquenessAttributeName value:_whFontObliqueness];
}

- (void)addAttribute:(id)attribute value:(id)value
{
    [self.attributeDict setObject:value forKey:attribute];
}




//段落的set方法
- (void)setWhParaLineSpacing:(CGFloat)whParaLineSpacing
{
    _whParaLineSpacing = whParaLineSpacing;
    self.paraStyle.lineSpacing = _whParaLineSpacing;
}
- (void)setWhParaSpacing:(CGFloat)whParaSpacing
{
    _whParaSpacing = whParaSpacing;
    self.paraStyle.paragraphSpacing = _whParaSpacing;
}
- (void)setWhParaAlignment:(NSTextAlignment)whParaAlignment
{
    _whParaAlignment = whParaAlignment;
    self.paraStyle.alignment = _whParaAlignment;
}
- (void)setWhParaFirstLineHeadIndent:(CGFloat)whParaFirstLineHeadIndent
{
    _whParaFirstLineHeadIndent = whParaFirstLineHeadIndent;
    self.paraStyle.firstLineHeadIndent = _whParaFirstLineHeadIndent;
}
- (void)setWhParaMinimumLineHeight:(CGFloat)whParaMinimumLineHeight
{
    _whParaMinimumLineHeight = whParaMinimumLineHeight;
    self.paraStyle.minimumLineHeight = _whParaMinimumLineHeight;
}
- (void)setWhParaMaximumLineHeight:(CGFloat)whParaMaximumLineHeight
{
    _whParaMaximumLineHeight = whParaMaximumLineHeight;
    self.paraStyle.maximumLineHeight = _whParaMaximumLineHeight;
}
- (void)setWhParaHeadIndent:(CGFloat)whParaHeadIndent
{
    _whParaHeadIndent = whParaHeadIndent;
    self.paraStyle.headIndent = _whParaHeadIndent;
}




#pragma mark - block 实现链式编程
//链式编程 需要借助block来实现
- (WHTextAttribute *)and
{
    return self;
}
- (WHTextAttribute *)with
{
    return self;
}

//返回block代码块
//////////// 文字 /////////////
- (WHBlockFloat)fontSize
{
    return ^(CGFloat fontSize){
        self.whFontSize = fontSize;
        return self;
    };
}
- (WHBlockColor)fontColor{
    return ^(UIColor *fontColor){
        self.whFontColor = fontColor;
        return self;
    };
}
- (WHBlockColor)fontBackgroundColor{
    return ^(UIColor *fontBackgroundColor){
        self.whFontBackgroundColor = fontBackgroundColor;
        return self;
    };
}
- (WHBlockNumber)fontKern{
    return ^(NSNumber *fontKern){
        self.whFontKern = fontKern;
        return self;
    };
}
- (WHBlockNumber)fontUnderline{
    return ^(NSNumber *fontUnderline){
        self.whFontUnderline = fontUnderline;
        return self;
    };
}
- (WHBlockColor)fontUnderlineColor{
    return ^(UIColor *fontUnderlineColor){
        self.whFontUnderlineColor = fontUnderlineColor;
        return self;
    };
}
- (WHBlockNumber)fontObliqueness{
    return ^(NSNumber *fontObliqueness){
        self.whFontObliqueness = fontObliqueness;
        return self;
    };
}

//////////// 段落 /////////////
- (WHBlockFloat)paraLineSpacing
{
    return ^(CGFloat lineSpacing){
        _paraStyle.lineSpacing = lineSpacing;
        return self;
    };
}
- (WHBlockFloat)paraSpacing
{
    return ^(CGFloat paragraphSpacing){
        _paraStyle.paragraphSpacing = paragraphSpacing;
        return self;
    };
}
- (WHTextAttribute *(^)(NSTextAlignment))paraAlignment
{
    return ^(NSTextAlignment alignment){
        _paraStyle.alignment = alignment;
        return self;
    };
}
- (WHBlockFloat)paraFirstLineHeadIndent
{
    return ^(CGFloat firstLineHeadIndent){
        _paraStyle.firstLineHeadIndent = firstLineHeadIndent;
        return self;
    };
}
- (WHBlockFloat)paraMinimumLineHeight
{
    return ^(CGFloat minimumLineHeight){
        _paraStyle.minimumLineHeight = minimumLineHeight;
        return self;
    };
}
- (WHBlockFloat)paraMaximumLineHeight
{
    return ^(CGFloat maximumLineHeight){
        _paraStyle.maximumLineHeight = maximumLineHeight;
        return self;
    };
}
- (WHBlockFloat)paraHeadIndent
{
    return ^(CGFloat headIndent){
        _paraStyle.headIndent = headIndent;
        return self;
    };
}


@end
