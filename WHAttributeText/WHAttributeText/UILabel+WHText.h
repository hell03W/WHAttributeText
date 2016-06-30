//
//  UILabel+WHAttributeLabel.h
//  WHAttributeText
//
//  Created by  www.6dao.cc on 15/12/23.
//  Copyright © 2015年 wandels. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (WHText)

/// 根据文本的样式/属性, 获取文本所占的宽度.
- (float)getTextWidth;

/// 文本宽度自适应.
- (void)autoTextWidth;


//1, 根据label上的文字和设置, 将label.text 变成label.attributeText.



@end
