//
//  ViewController.m
//  audioSound
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 anxin. All rights reserved.
//

#import "ViewController.h"
#import "JFMyPlayerSound.h"
#import "RBDMuteSwitch.h"

//1.获取设备宽高
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height
#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,RBDMuteSwitchDelegate>
{
    NSIndexPath *_selecetIndexpath;
}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSArray *dataSource;
@property(nonatomic,strong)NSArray *dataSource2;
@property(nonatomic,strong)JFMyPlayerSound *myPlaySounde;
@end

@implementation ViewController

-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0,64, kDeviceWidth, kDeviceHeight-64) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.tableFooterView = [[UIView alloc]init];

    }
    return _tableview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"手机铃声";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.dataSource = @[@"收到信息",@"三全音",@"管钟琴",@"玻璃",@"圆号",@"铃声",@"电子乐",@"发送信息",@"发送邮件",@"收到新邮件",@"拨号面板0按键",@"拨号面板1按键",@"拨号面板2按键",@"开始录音",@"低电量提示"];
    self.dataSource2 = @[@"ReceivedMessage",@"sms-received1",@"sms-received2",@"sms-received3",@"sms-received4",@"sms-received5",@"sms-received6",@"SentMessage",@"mail-sent",@"new-mail",@"dtmf-0",@"dtmf-1",@"dtmf-2",@"begin_record",@"low_power"];
    [self.view addSubview:self.tableview];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selecetIndexpath = indexPath;
    [[RBDMuteSwitch sharedInstance]setDelegate:self];
    [[RBDMuteSwitch sharedInstance] detectMuteSwitch];
}

/**
 *  是否开启静音模式
 *
 */
-(void)isMuted:(BOOL)muted
{
    NSLog(@"muted-----%d",muted);
    if (muted) {
        //开启静音模式
         self.myPlaySounde = [[JFMyPlayerSound alloc] initSystemShake];
    }else{
        //关闭静音模式
        NSString *name = [NSString stringWithFormat:@"%@",self.dataSource2[_selecetIndexpath.row]];
        self.myPlaySounde = [[JFMyPlayerSound alloc] initSystemSoundWithName:name SoundType:@"caf"];
    }
    [self.myPlaySounde play];
}


@end
