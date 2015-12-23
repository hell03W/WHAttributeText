#富文本工具类

##1. 创建属性字符串
***
###1.1 使用实例方法获取属性字符串
示例代码:

	//1.1 测试返回属性字符串
	WHAttributeText *att = [WHAttributeText attributeText];
	att.string = @"ans阿基里斯那是看你老公看见了那是的高科技那公司的空间里那个谁看见了就爱点谁看见了就爱点附近";
	att.fontSize(15).fontColor([UIColor redColor]).fontObliqueness(@0.5);
	NSMutableAttributedString *attributeString = [att getAttributeString];

