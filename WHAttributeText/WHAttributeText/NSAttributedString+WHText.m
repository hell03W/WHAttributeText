//
//  NSAttributedString+WHText.m
//  WHAttributeText
//
//  Created by  www.6dao.cc on 16/6/30.
//  Copyright © 2016年 wandels. All rights reserved.
//

#import "NSAttributedString+WHText.h"
#import "WHTextAttribute.h"

@implementation NSAttributedString (WHText)

- (NSMutableAttributedString *)addAttributeToRange:(NSRange)range attribute:(void (^)(WHTextAttribute *make))block {
    
    NSMutableAttributedString *mutlAttrString = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    [mutlAttrString addAttributeToRange:range attribute:block];

    return mutlAttrString;
}

@end


@implementation NSMutableAttributedString (WHText)

- (NSMutableAttributedString *)addAttributeToRange:(NSRange)range attribute:(void (^)(WHTextAttribute *make))block {
    
    WHTextAttribute *attribute = [WHTextAttribute attribute];
    block(attribute);
    
    [self addAttributes:attribute.attributeDict range:range];
    
    return self;
}

@end