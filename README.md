# MYCoreTextLabel
</p>
</p>
<b>轻量级图文混排 , 实现图片文字混排 , 可显示常规链接比如网址,@,话题等 , 可以自定义链接字,设置关键字高亮等功能 . 适用于微博,微信,IM聊天对话等场景 . 仅需几百行代码

</p>
</p>
</p>

## 1. 静态图文文字混排 </p>

```
    _coreTextLabel.imageSize = CGSizeMake(25, 25);  // 设置图片尺寸 , 默认和字体一样
    _coreTextLabel.textFont  = [UIFont systemFontOfSize:16.f]; //设置普通文本大小 , 默认14.f
    _coreTextLabel.textColor = [UIColor brownColor]; //设置普通文本字体颜色 , 默认黑色
    _coreTextLabel.lineSpacing = 5;  //设置行间距
    _coreTextLabel.wordSpacing = 2;  //设置字间距

    //如果不需要任何的自定义链接和关键字, 赋值nil即可
    [_coreTextLabel setText:@"满街脚步突然静了[调皮],满天柏树[白眼]突然没有动摇,这一刹[擦汗]我只需要一罐热茶吧,那味道似是[滑稽]什么都不紧要,唱片店内[擦汗]传来异国民谣,那种快乐[白眼]突然被我需要,不亲切[调皮]至少不似想你般[龇牙]奥妙,情和调随著怀缅变得萧条,原来过得很快乐[擦汗],[白眼]只我一人未发觉,如能忘掉渴望,[花心]岁月长衣裳薄,无论于什么角落[噘嘴],不假设你或会在旁,我也可畅游异国放心吃喝[调皮][调皮][调皮]" customLinks:nil keywords:nil];

    CGSize size = [coreTextLabel sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.coreTextLabel.frame = CGRectMake(0, 100, size.width, size.height);
    [self.view addSubview:coreTextLabel];
```
![image](https://github.com/coderMyy/MYCoreTextLabel/blob/master/examplePic/image.png)
</p>
</p>
</p>
</p>
</p>
</p>
</p>
</p>
</p>


## <b>2. 文字中的链接 , @ , #话题# , 网址 , 或者自定义需要链接的文字
```
    MYCoreTextLabel *coretextLabel = [[MYCoreTextLabel alloc]init];
    _coretextLabel.delegate = self;
    _coretextLabel.norLinkBackColor = [UIColor redColor];  //设置常规链接点击背景色   @ #话题#  www.baidu.com
    _coretextLabel.norLinkFont = [UIFont systemFontOfSize:20]; //设置常规链接的字体大小
    _coretextLabel.norLinkColor = [UIColor greenColor]; //设置常规链接的颜色
    _coretextLabel.hiddenNormalLink = NO;  // 是否显示常规链接特性  ,默认为NO,默认显示常规链接. 如果为YES , 上述的赋值没有任何意义 , 默认为NO
    [_coretextLabel setText:@"阿南。#测试#现在每次吃栗子我都会想起父亲，想起小时候每到深秋，父亲#测试#在地里干农活都会在家乡的山间摘好多野栗子回来给我吃，他不给哥哥吃，他自己也不吃。只给我一个人吃。看到你在书里写给阿明的信，好几次我都哽咽了。阿明尚ww.dsa.cn且对你如此，可你却还的如此的爱他www.baidu.com。可对于我的父亲，我深觉自己做的这www.google.cn些微不足道，甚至不值一提。去年他动手术，我和哥哥送他去医院，晚上，我和哥哥离开，只留他#测试#一人在医院。第二日，我去医院@小明 看到手术后的他躺在病床上憔悴不已。母亲守在一旁。心揪成一团。三个月前哥哥大婚，看他和母亲忙前忙后，看到他满脸的胡渣以及母亲双鬓若隐若现的白发。更是心痛不已。www.123.com" customLinks:@[@"哥哥"] keywords:nil];

     //设置frame
     CGSize size              = [coretextLabel sizeThatFits:CGSizeMake(200, 600)];
     self.coretextLabel.frame = CGRectMake(100, 100, size.width, size.height);
     [self.view addSubview:coretextLabel];
```
 ![image](https://github.com/coderMyy/MYCoreTextLabel/blob/master/examplePic/linksGIF.gif)
</p>
</p>
</p>
</p>
</p>
</p>
</p>

## 3. 文字中的关键字显示
```
    MYCoreText *coretextLabel = [[MYCoreTextLabel alloc]init];
    _coretextLabel.textFont = [UIFont systemFontOfSize:14.f]; //设置文本大小
    _coretextLabel.textColor = [UIColor brownColor];       // 设置文本颜色
    _coretextLabel.lineSpacing = 2;    //设置行间距
    _coretextLabel.wordSpacing = 1.5;  //设置字间距
    _coretextLabel.keyWordColor = [UIColor redColor]; //设置关键字颜色
    _coretextLabel.keyWordBackColor = [UIColor yellowColor]; //设置关键字背景高亮色 , 如果不需要可自行调整为透明 或者和背景色一样 , 默认是黄色的
    _coretextLabel.hiddenNormalLink = YES; // hiddenNormalLink为YES ,不显示所有的常规链接特性, 所以常规链接也都是直接以普通文本方式展示 , 并不可点击
    [_coretextLabel setText:@"山脚至山腰是茂盛青翠的马尾松、楠木、云杉、枫树等树林，绵延几十公里，瞬间把游客带进世外桃源。山腰朝上，杂生着三百多种杜鹃树，杜鹃树不高，一米两米不等，马樱花类居多。听导游介绍，“大理三月好风光”时节，三百多种杜鹃花盛开，将苍山装扮成花的海洋。www.google.cn 红色、白色、紫色交相辉映，恍惚人间天堂。海拔四千米以上，由于气候寒冷，草木无法生长，终年积雪，皑皑如白云飘落山顶.苍山巍峨，十九座尖峰高耸入云，山顶白雪皑皑，晶莹剔透，犹如海明威小说中的乞力马扎罗雪峰，“苍山雪”由此而来。雪峰下是草甸，@顺坡势绵延着一望无际的绿草，莽莽苍苍，微风过处，送来阵阵远古苍茫。草丛中，洁白的大雪素展示肤色，蓝色龙胆不停地眨眼，绯红绿绒蒿卖弄衣裳，金色的柴胡在招摇，红色紫云英微笑不停……更有许多不知道名字的杂草一个劲地绿，阳光下开心地开满了花朵，朵朵都在人们眼前盼望，www.baidu.com美丽可爱野花是雪峰的祝福，#是山坡的语言#，#是苍山的心事#，是小草和花朵为沧桑写下的抒情诗歌。成双成对的彩斑蝶于花海中翩翩起舞，嗡嗡的蜜蜂在花瓣间打闹。草甸以下青一色郁郁葱葱的林海，四季青翠的马尾松，笔直修长的杉木，高大俊秀的枫树，@枝繁叶茂的楠木，摇弋多姿的板栗……逍遥的松鼠在树枝间练功，喜鹊逗留树顶啁啾，子规在杜鹃枝缝里跳跃，金丝鸟在草丛嬉戏，@好不热闹！树下，蚂蚁在腐烂落叶堆中穿行……林间仙雾缭绕，清香沁肺。十九峰高耸入云，巍峨雄壮，山峰下沟壑纵横；十八溪流水潺潺，涧泉汩汩，飞瀑挂于岩石悬崖。姊妹山——鸡足山顶庙塔玲珑剔透，金碧辉煌；北面玉龙雪山莽莽苍苍，冰清玉洁。玉局峰下百余米处有个方圆十来亩的圆形水潭，名叫洗马潭，是玉局峰、龙泉峰雪水积淀而成，潭水清澈，滟滟如梦" customLinks:@[@"十九"] keywords:@[@"苍山",@"大理",@"导游"]];
    //customLinks : 添加自定义链接字 , 如不需要 , 传nil , 可以添加自定义链接的一些属性
    //keywords : 关键字 ,如不需要,传nil即可
    _coretextLabel.delegate = self;  //设置代理便可监听点击的文本以及类型

    CGSize size = [coretextLabel sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width, MAXFLOAT)];
    coretextLabel.frame = CGRectMake(0, 100, size.width, size.height);
    [self.view addSubview:coretextLabel];

```
![image](https://github.com/coderMyy/MYCoreTextLabel/blob/master/examplePic/keywordGIF.gif)
</p>
</p>
</p>
</p>
</p>
</p>

## 4. 比较复杂的图文混排 (具体请参照DetailViewController中的使用)
```
    MYCoreText *coretextLabel = [[MYCoreTextLabel alloc]init];
    _coretextLabel.textFont = [UIFont systemFontOfSize:15.f];   //设置普通内容文字大小
    _coretextLabel.textColor = [UIColor brownColor];   // 设置普通内容文字颜色
    _coretextLabel.norLinkFont = [UIFont systemFontOfSize:18.f];  //设置常规链接字体大小  @ #话题# www.baidu.com 网址类型
    _coretextLabel.norLinkColor = [UIColor blueColor];  //设置常规链接字体颜色
    _coretextLabel.norLinkBackColor = [UIColor redColor];  //设置常规链接点击背景色
    _coretextLabel.customLinkFont = [UIFont systemFontOfSize:18.f];  //设置自定义链接字 字体大小
    _coretextLabel.customLinkColor = [UIColor greenColor];  //设置自定义链接字体颜色
    _coretextLabel.customLinkBackColor = [UIColor orangeColor];  //设置自定义链接点击背景色
    _coretextLabel.keyWordColor = [UIColor redColor];  //设置关键字颜色
    _coretextLabel.keyWordBackColor = [UIColor blueColor];  //设置关键字高亮背景色
    _coretextLabel.hiddenNormalLink = NO;  // 不显示常规链接 , 默认为NO  即默认显示常规链接 , 如果不需要显示 , 赋值为YES即可
    _coretextLabel.lineSpacing = 5;   //设置行间距
    _coretextLabel.wordSpacing = 0.5; //设置字间距
    _coretextLabel.delegate = self;   //设置代理 , 用于监听点击事件 以及接收点击内容等

    //设置frame
    CGSize size = [coretextLabel sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.coretextLabel.frame = CGRectMake(0, 20, size.width, size.height);
    [self.view addSubviews:coretextLabel];
```
![image](https://github.com/coderMyy/MYCoreTextLabel/blob/master/examplePic/detailGIF.gif)
</p>
</p>
</p>
</p>
</p>




