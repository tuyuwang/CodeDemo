//
//  TaobaoSettingPresenter.m
//  CodeDemo
//
//  Created by tuyw on 2024/2/8.
//

#import "TaobaoSettingPresenter.h"
#import "SettingModel+Constructor.h"
#import "SettingJsonModel.h"
#import "ProtocolSettingCell.h"

@import YYModel;
@import WebKit;

@interface TaobaoSettingPresenter ()

@property (nonatomic, copy) NSArray<NSArray<id<SettingModelProtocol>> *> *models;
@property (nonatomic, assign) BOOL dataFromJson;

@end

@implementation TaobaoSettingPresenter

+ (TaobaoSettingPresenter *)dataFromJson:(BOOL)fromJson {
    TaobaoSettingPresenter *presenter = [TaobaoSettingPresenter new];
    presenter.dataFromJson = fromJson;
    return presenter;
}

- (NSArray<NSArray<id<SettingModelProtocol>> *> *)dataSource {
   
    
    if (self.dataFromJson) {
        self.models = [self getDataSourceFromJson];
    } else {
        self.models = [self getDataSourceFromCode];
    }
    
    return self.models;
}

- (UIEdgeInsets)separatorInset {
    return UIEdgeInsetsMake(0, 12, 0, 0);
}


- (NSString *)title {
    return @"淘宝-设置";
}

#pragma mark - Cell Click

- (void)avatar {
    NSLog(@"avatar");
}

- (void)address {
    NSLog(@"address");
}

- (void)myProfile {
    NSLog(@"myProfile");
}

- (void)account {
    NSLog(@"account");
}

- (void)pay {
    NSLog(@"pay");
}

- (void)messageNoti {
    NSLog(@"messageNoti");
}

- (void)themeSkinChanging {
    NSLog(@"themeSkinChanging");
}

- (void)changeIcon {
    NSLog(@"changeIcon");
}

- (void)modeChange {
    NSLog(@"modeChange");
}

- (void)privacy {
    NSLog(@"privacy");
}

- (void)currency {
    NSLog(@"currency");
}

- (void)help {
    NSLog(@"help");
}

- (void)about {
    NSLog(@"about");
}

- (void)merchantCheckIn {
    NSLog(@"merchantCheckIn");
}

- (void)changeAccount {
    NSLog(@"changeAccount");
}

- (void)logout {
    NSLog(@"logout");
}

- (void)cell:(UITableViewCell *)cell didSelected:(NSIndexPath *)indexPath parameters:(id)parameters {
    NSLog(@"open link: %@", parameters);
}

#pragma mark - Private

- (NSArray<NSArray<id<SettingModelProtocol>> *> *)getDataSourceFromCode {
    NSString *subtitle = @"账号名：酱鸭做吗";
    NSString *avatar = @"https://img.touxiangkong.com/uploads/allimg/2022021820/awmxjquxevq.jpg";
    return @[
        @[[SettingModel avaterCell:@"青藏澳元" avatar:avatar subtitle:subtitle selector:@selector(avatar)],
          [SettingModel sampleCell:@"我的收获地址" selector:@selector(address)],
          [SettingModel sampleCell:@"我的档案" accessory:@"添加档案，获得精准推荐" selector:@selector(myProfile)]],
        
        @[[SettingModel sampleCell:@"账号与安全" selector:@selector(account)],
          [SettingModel sampleCell:@"支付" accessory:@"支付宝账号、免密支付等" selector:@selector(pay)]],
        
        @[[SettingModel sampleCell:@"消息通知" selector:@selector(messageNoti)],
          [SettingModel sampleCell:@"主题换肤" selector:@selector(themeSkinChanging)],
          [SettingModel sampleCell:@"图标切换" accessory:@"默认88/VIP" selector:@selector(changeIcon)],
          [SettingModel sampleCell:@"模式切换" accessory:@"标准/长辈模式" selector:@selector(modeChange)],
          [SettingModel sampleCell:@"隐私" selector:@selector(privacy)],
          [SettingModel sampleCell:@"通用" accessory: @"地区、音效、辅助等功能" selector:@selector(currency)]],
        
        @[[SettingModel sampleCell:@"帮助与反馈" selector:@selector(help)],
          [SettingModel sampleCell:@"关于淘宝" selector:@selector(about)]],
        
        @[[SettingModel sampleCell:@"商家入住" selector:@selector(merchantCheckIn)]],
        
        @[[SettingModel exitCell:@"切换账号" selector:@selector(changeAccount)]],
        
        @[[SettingModel exitCell:@"退出登录" selector:@selector(logout)]],
        
        @[[SettingModel exitCell:@"退出登录" selector:@selector(logout)]]
    ];
}

- (NSArray<NSArray<id<SettingModelProtocol>> *> *)getDataSourceFromJson {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"taobao_settings" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    NSArray<NSArray *> *items = jsonObject[@"data"];
    NSMutableArray *settingModels = [NSMutableArray array];
    [items enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *models = [NSArray yy_modelArrayWithClass:SettingJsonModel.class json:obj];
        [settingModels addObject:models];
    }];
    return settingModels.copy;
}
@end
