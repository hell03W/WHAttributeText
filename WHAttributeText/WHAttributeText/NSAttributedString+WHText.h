//
//  NSAttributedString+WHText.h
//  WHAttributeText
//
//  Created by  www.6dao.cc on 16/6/30.
//  Copyright © 2016年 wandels. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WHTextAttribute;

@interface NSAttributedString (WHText)

- (NSMutableAttributedString *)addAttributeToRange:(NSRange)range attribute:(void (^)(WHTextAttribute *make))block;

@end


@interface NSMutableAttributedString (WHText)

- (NSMutableAttributedString *)addAttributeToRange:(NSRange)range attribute:(void (^)(WHTextAttribute *make))block;

@end
