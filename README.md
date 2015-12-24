#富文本工具类

##1. 获取属性字符串
***
###1.1 实例方法获取属性字符串
使用实例方法获取属性字符串时候,需要注意的是,必须在调用`getText`方法之前设置字符串属性,否则不能得到想要的属性字符串.
######示例代码:

	//1.1 测试返回属性字符串
	WHText *att = [WHText text];
	att.string = @"ans阿基里斯那是看你老公看见了那是的高科技那公司的空间里那个谁看见了就爱点谁看见了就爱点附近";
	att.fontSize(15).fontColor([UIColor redColor]).fontObliqueness(@0.5);
	NSMutableAttributedString *attributeString = [att getText];

###1.2 类方法获取属性字符串
使用类方法获取属性字符串,使用方法如下所示,只需要在block中设置字体的属性或者段落的属性即可,完美支持链式编程.
######示例代码:

	//类方法获取属性字符串
	NSMutableAttributedString *attString = [WHText getTextWithString:str andAttribute:^(WHText *make) {
        make.fontSize(15).fontColor([UIColor blueColor]).fontObliqueness(@0.5);
    }];


##2. 获取属性字典
***
###2.1 实例方法获取属性字典
######示例代码:

	//2.1 实例方法 获取属性字典
    WHText *whText = [WHText text];
    whText.fontSize(20).fontColor([UIColor redColor]).paraAlignment(NSTextAlignmentCenter);
    NSDictionary *dict = [whText getAttributeDictionary];
    NSLog(@"--- %@ ---", dict);
###2.2 实例方法获取属性字典
######示例代码:
	NSDictionary *dict2 = [WHText getAttributeDictionary:^(WHText *make) {
        make.fontSize(20).fontColor([UIColor redColor]).paraAlignment(NSTextAlignmentCenter);
    }];
    NSLog(@"--- %@ ---", dict2);


##3. 获取放置属性字符串的Label
***
###3.1 获取放着属性字符串的label
注意:使用这个方法时候,,必须在调用`getAttributeLabel`方法之前调用`whText1.string`这个方法,设置字符串,否则无法得到正确的label.<br>
默认情况下,得到的label的宽度是`设置平模宽度-40`,如果要设置宽度调用方法:

	whText1.textWidth(200);
	或者
    whText1.width = 200;
得到label之后,也可以通过`lebel.frame`得到label的宽度和高度.
######示例代码:
	WHText *whText1 = [WHText text];
    whText1.fontSize(20).fontColor([UIColor orangeColor]).paraAlignment(NSTextAlignmentCenter);
    whText1.string = @"ans阿基里斯那是看你老公看见了那是的高科技那公司的空间里那个谁看见了就爱点谁看见了就爱点附近";
    UILabel *lab3 = [whText1 getAttributeLabel];

###3.2 通过类方法获取放着属性字符串的label
通过类方法,直接获取一个放着属性字符串的label
######示例代码:
	UILabel *lab4 = [WHText getLabelWithText:str andWidth:200 andAttribute:^(WHText *make) {
        make.fontSize(10).fontColor([UIColor orangeColor]).paraAlignment(NSTextAlignmentCenter);
    }];
    [self.view addSubview:lab4];






##其它
***
###1) 


















