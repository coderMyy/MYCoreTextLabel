# MYCoreTextLabel
</p>
</p>
轻量级图文混排 , 实现图片文字混排 , 可显示常规链接比如网址,@,话题等 , 可以自定义链接字,设置关键字高亮等功能 . 适用于微博,微信,IM聊天对话等场景 . 仅需几百行代码

</p>
</p>
</p>

1. 静态图文文字混排 </p>
```
    MYCoreTextLabel  * coreTextLabel = [[MYCoreTextLabel alloc]init];
    //创建相关属性的模型
    MYAttributeModel *model = [[MYAttributeModel alloc]init];
    model.imageSize         = CGSizeMake(25, 25);  // 设置图片尺寸 , 默认和字体一样
    model.textFont          = [UIFont systemFontOfSize:16.f]; //设置普通文本大小 , 默认14.f
    model.textColor         = [UIColor brownColor]; //设置普通文本字体颜色 , 默认黑色
    coreTextLabel.attribute = model;  //赋值模型
    [coreTextLabel text:@"满街脚步突然静了[调皮],满天柏树[白眼]突然没有动摇,这一刹[擦汗]我只需要一罐热茶吧,那味道似是[滑稽]什么都不紧要,唱片店内[擦汗]传来异国民谣,那种快乐[白眼]突然被我需要,不亲切[调皮]至少不似想你般[龇牙]奥妙,情和调随著怀缅变得萧条,原来过得很快乐[擦汗],[白眼]只我一人未发觉,如能忘掉渴望,[花心]岁月长衣裳薄,无论于什么角落[噘嘴],不假设你或会在旁,我也可畅游异国放心吃喝[调皮][调皮][调皮]" customLinks:nil];
    CGSize size = [coreTextLabel sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.coreTextLabel.frame = CGRectMake(0, 100, size.width, size.height);
    [self.view addSubview:coreTextLabel];
```
</p>
 ![image](https://github.com/coderMyy/MYCoreTextLabel/blob/master/examplePic/image.png)
</p>
</p>
</p>
</p>
</p>
</p>
</p>
</p>
2. 文字中的链接 , @ , #话题# , 网址 , 或者自定义需要链接的文字
 ![image](https://github.com/coderMyy/MYCoreTextLabel/blob/master/examplePic/linksGIF.gif)
</p>
</p>
</p>
</p>
</p>
</p>
</p>
3. 文字中的关键字显示
![image](https://github.com/coderMyy/MYCoreTextLabel/blob/master/examplePic/keywordGIF.gif)
</p>
</p>
</p>
</p>
</p>
</p>
4. 比较复杂的图文混排
![image](https://github.com/coderMyy/MYCoreTextLabel/blob/master/examplePic/detailGIF.gif)
</p>
</p>
</p>
</p>
</p>




