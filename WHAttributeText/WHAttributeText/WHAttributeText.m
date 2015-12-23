//
//  WHAttributeText.m
//  WHAttributeText
//
//  Created by len on 15/10/21.
//  Copyright (c) 2015年 wandels. All rights reserved.
//

#import "WHAttributeText.h"

@interface WHAttributeText ()

@property (nonatomic, strong)NSMutableDictionary *whAttributeDictionary;

@end

@implementation WHAttributeText

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
+ (id)attributeTextWithString:(NSString *)text
{
    return [[self alloc] initWithString:text];
}

+ (id)attributeText
{
    return [[self alloc] init];
}


#pragma mark - 一些其它方法
//1, 获取属性字符串 返回 NSMutableAttributedString 类型
     //调用这个方法之后才能获取size
- (id)getAttributeString
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

//2, 返回设置好属性和长宽的label
- (UILabel *)getAttributeLabel
{
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.attributedText = [self getAttributeString];
    label.backgroundColor = [UIColor whiteColor];
    
    return label;
}

//3, 返回指定背景颜色的label
- (UILabel *)getAttributeLabelWithBgColor:(UIColor *)bgColor
{
    UILabel *label = [self getAttributeLabel];
    label.backgroundColor = bgColor;
    return label;
}

//4, 获取属性字典
- (id)getAttributeDictionary
{
    return self.whAttributeDictionary;
}
+ (id)getAttributeDictionary:(void (^)(WHAttributeText *make))block
{
    WHAttributeText *attributeText = [[WHAttributeText alloc] init];
    block(attributeText);
    return [attributeText getAttributeDictionary];
}



#pragma mark - set方法， 添加段落或者文字的属性
- (void)addAttribute:(id)attribute value:(id)value
{
    [self.whAttributeDictionary setObject:value forKey:attribute];
}

- (CGFloat)height
{
    [self getAttributeString];
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





//段落的set方法
- (void)setWhParaLineSpacing:(CGFloat)whParaLineSpacing
{
    _whParaLineSpacing = whParaLineSpacing;
    self.whParagrahStyle.lineSpacing = _whParaLineSpacing;
}
- (void)setWhParaSpacing:(CGFloat)whParaSpacing
{
    _whParaSpacing = whParaSpacing;
    self.whParagrahStyle.paragraphSpacing = _whParaSpacing;
}
- (void)setWhParaAlignment:(NSTextAlignment)whParaAlignment
{
    _whParaAlignment = whParaAlignment;
    self.whParagrahStyle.alignment = _whParaAlignment;
}
- (void)setWhParaFirstLineHeadIndent:(CGFloat)whParaFirstLineHeadIndent
{
    _whParaFirstLineHeadIndent = whParaFirstLineHeadIndent;
    self.whParagrahStyle.firstLineHeadIndent = _whParaFirstLineHeadIndent;
}
- (void)setWhParaMinimumLineHeight:(CGFloat)whParaMinimumLineHeight
{
    _whParaMinimumLineHeight = whParaMinimumLineHeight;
    self.whParagrahStyle.minimumLineHeight = _whParaMinimumLineHeight;
}
- (void)setWhParaMaximumLineHeight:(CGFloat)whParaMaximumLineHeight
{
    _whParaMaximumLineHeight = whParaMaximumLineHeight;
    self.whParagrahStyle.maximumLineHeight = _whParaMaximumLineHeight;
}
- (void)setWhParaHeadIndent:(CGFloat)whParaHeadIndent
{
    _whParaHeadIndent = whParaHeadIndent;
    self.whParagrahStyle.headIndent = _whParaHeadIndent;
}


#pragma mark - block 实现链式编程
//链式编程 需要借助block来实现
- (WHAttributeText *)and
{
    return self;
}
- (WHAttributeText *)with
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
        _whParagrahStyle.lineSpacing = lineSpacing;
        return self;
    };
}
- (WHBlockFloat)paraSpacing
{
    return ^(CGFloat paragraphSpacing){
        _whParagrahStyle.paragraphSpacing = paragraphSpacing;
        return self;
    };
}
- (WHAttributeText *(^)(NSTextAlignment))paraAlignment
{
    return ^(NSTextAlignment alignment){
        _whParagrahStyle.alignment = alignment;
        return self;
    };
}
- (WHBlockFloat)paraFirstLineHeadIndent
{
    return ^(CGFloat firstLineHeadIndent){
        _whParagrahStyle.firstLineHeadIndent = firstLineHeadIndent;
        return self;
    };
}
- (WHBlockFloat)paraMinimumLineHeight
{
    return ^(CGFloat minimumLineHeight){
        _whParagrahStyle.minimumLineHeight = minimumLineHeight;
        return self;
    };
}
- (WHBlockFloat)paraMaximumLineHeight
{
    return ^(CGFloat maximumLineHeight){
        _whParagrahStyle.maximumLineHeight = maximumLineHeight;
        return self;
    };
}
- (WHBlockFloat)paraHeadIndent
{
    return ^(CGFloat headIndent){
        _whParagrahStyle.headIndent = headIndent;
        return self;
    };
}


@end












