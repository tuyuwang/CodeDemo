//
//  DriverSettingPresenter.m
//  CodeDemo
//
//  Created by tuyw on 2024/2/7.
//

#import "DriverSettingPresenter.h"
#import "SettingModel.h"
#import "SettingModel+Constructor.h"

#import "SwitchSettingCell.h"

@interface DriverSettingPresenter ()

@property (nonatomic, copy) NSArray<NSArray<id<SettingModelProtocol>> *> *models;
@end

@implementation DriverSettingPresenter

- (NSArray<NSArray<id<SettingModelProtocol>> *> *)dataSource {
    NSString *subtitle = @"关闭后将减少通过电话、短信及微信等形式推送的有关货拉拉服务的优惠活动、奖励及其他营销推广信息";
    
    self.models = @[
        @[[SettingModel sampleCell:@"新订单通知" selector:@selector(newOrderPush)],
          [SettingModel switchCell:@"聊天消息语音提示" isOpen:NO],
          [SettingModel switchCell:@"营销电话与短信通知" isOpen:NO subtitle:subtitle]],
        
        @[[SettingModel sampleCell:@"接单操作设置" selector:@selector(pickupOrder)]],
        
        @[[SettingModel sampleCell:@"货运业务费用标准" selector:@selector(freightTransport)],
          [SettingModel sampleCell:@"搬家业务费用标准" selector:@selector(moveHouse)],
          [SettingModel sampleCell:@"货拉拉法律条款" selector:@selector(legalProvisions)],
          [SettingModel sampleCell:@"分享货拉拉" selector:@selector(share)],
          [SettingModel sampleCell:@"关于货拉拉" selector:@selector(about)]],
        
        @[[SettingModel sampleCell:@"账号与隐私" selector:@selector(accountPrivacy)],
          [SettingModel sampleCell:@"个人信息收集清单" selector:@selector(infoList)],
          [SettingModel sampleCell:@"第三方SDK目录" selector:@selector(otherFramework)],
          [SettingModel sampleCell:@"第三方共享清单" selector:@selector(otherShare)]],
        
        @[[SettingModel exitCell:@"退出登录" selector:@selector(logout)]]
    ];
    
    return self.models;
}

- (UIEdgeInsets)separatorInset {
    return UIEdgeInsetsMake(0, 4, 0, 4);
}


- (NSString *)title {
    return @"司机-设置";
}

#pragma mark - Cell Click

- (void)newOrderPush {
    NSLog(@"newOrderPush");
}

- (void)pickupOrder {
    NSLog(@"pickupOrder");
}

- (void)freightTransport {
    NSLog(@"freightTransport");
}

- (void)moveHouse {
    NSLog(@"moveHouse");
}

- (void)legalProvisions {
    NSLog(@"legalProvisions");
}

- (void)share {
    NSLog(@"share");
}

- (void)about {
    NSLog(@"about");
}

- (void)accountPrivacy {
    NSLog(@"accountPrivacy");
}

- (void)infoList {
    NSLog(@"infoList");
}

- (void)otherFramework {
    NSLog(@"otherFramework");
}

- (void)otherShare {
    NSLog(@"otherShare");
}

- (void)logout {
    NSLog(@"logout");
}

#pragma mark - SettingCellEventProtocol

- (void)cell:(UITableViewCell *)cell didSelected:(NSIndexPath *)indexPath parameters:(id)parameters {
    if (self.models.count > indexPath.section &&
        self.models[indexPath.section].count > indexPath.row) {
        NSLog(@"%@:\nmodel: %@\nchange switch: %d", cell, self.models[indexPath.section][indexPath.row], [parameters boolValue]);
        
        if ([cell isKindOfClass:SwitchSettingCell.class]) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [(SwitchSettingCell *)cell updateSwitch:NO];
            });
        }
        
    }
}

@end
