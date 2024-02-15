//
//  UserSettingPresenter.m
//  CodeDemo
//
//  Created by tuyw on 2024/2/7.
//

#import "UserSettingPresenter.h"
#import "SettingModel.h"
#import "SettingModel+Constructor.h"
#import "SwitchSettingCell.h"

@interface UserSettingPresenter ()

@property (nonatomic, copy) NSArray<NSArray<id<SettingModelProtocol>> *> *models;

@end

@implementation UserSettingPresenter

- (NSArray<NSArray<id<SettingModelProtocol>> *> *)dataSource {
    UIColor *color = [UIColor colorWithRed:255/255.0f green:102/255.0 blue:0/255.0 alpha:1.0];

    self.models = @[
        @[[SettingModel sampleCell:@"个人信息" selector:@selector(personInfo)],
          [SettingModel sampleCell:@"账号" selector:@selector(account)],
          [SettingModel sampleCell:@"紧急联系人" accessory:@"去添加" selector:@selector(emergencyContac)]],
        
        @[[SettingModel sampleCell:@"消息通知设置" selector:@selector(messagetNoti)],
          [SettingModel sampleCell:@"隐私权限管理" selector:@selector(privacy)],
          [SettingModel sampleCell:@"模式切换" accessory:@"极简/物流模式" selector:@selector(changeMode)],
          [SettingModel switchCell:@"截屏弹出弹窗" isOpen:NO]],
        
        @[[SettingModel sampleCell:@"给货拉拉评论" selector:@selector(comment)],
          [SettingModel sampleCell:@"分享" selector:@selector(share)]],
        
        @[[SettingModel sampleCell:@"收费标准" selector:@selector(feeStandards)],
          [SettingModel sampleCell:@"货拉拉法律条款" selector:@selector(legalProvisions)],
          [SettingModel sampleCell:@"关于货拉拉" accessory:@"发现新版本" selector:@selector(newVersion)]],
        
        @[[SettingModel exitCell:@"退出登录" color:color selector:@selector(logout)]]
    ];
    
    return self.models;
}

- (UIEdgeInsets)separatorInset {
    return UIEdgeInsetsMake(0, 12, 0, 0);
}


- (NSString *)title {
    return @"用户-设置";
}

#pragma mark - Cell Click

- (void)personInfo {
    NSLog(@"personInfo");
}

- (void)account {
    NSLog(@"account");
}

- (void)emergencyContac {
    NSLog(@"emergencyContac");
}

- (void)messagetNoti {
    NSLog(@"messagetNoti");
}

- (void)privacy {
    NSLog(@"privacy");
}

- (void)changeMode {
    NSLog(@"changeMode");
}

- (void)screenshotAlert {
    NSLog(@"screenshotAlert");
}

- (void)comment {
    NSLog(@"comment");
}

- (void)share {
    NSLog(@"share");
}

- (void)feeStandards {
    NSLog(@"feeStandards");
}

- (void)legalProvisions {
    NSLog(@"legalProvisions");
}

- (void)newVersion {
    NSLog(@"newVersion");
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
