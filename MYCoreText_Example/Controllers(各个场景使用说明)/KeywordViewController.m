//
//  KeywordViewController.m
//  复杂demo
//
//  Created by 孟遥 on 2017/2/14.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import "KeywordViewController.h"
#import "MYCoreTextLabel.h"

@interface KeywordViewController ()<MYCoreTextLabelDelegate>
@property (nonatomic, strong) MYCoreTextLabel *coretextLabel;

@end

@implementation KeywordViewController

- (MYCoreTextLabel *)coretextLabel
{
    if (!_coretextLabel) {
        _coretextLabel = [[MYCoreTextLabel alloc]init];
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
    }
    return _coretextLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"只展示关键字,其他不展示";
    CGSize size = [self.coretextLabel sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width, MAXFLOAT)];
    self.coretextLabel.frame = CGRectMake(0, 100, size.width, size.height);
    [self.view addSubview:self.coretextLabel];
}

- (void)linkText:(NSString *)clickString type:(MYLinkType)linkType
{
    NSLog(@"---------------%@ -------%li",clickString,linkType);
}

@end
