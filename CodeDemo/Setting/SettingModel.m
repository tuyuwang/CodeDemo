//
//  SettingModel.m
//  CodeDemo
//
//  Created by tuyw on 2024/2/7.
//

#import "SettingModel.h"

@implementation SettingModel

+ (SettingModel *)cell:(Class)cellClass model:(id)model selector:(SEL)selector {
    SettingModel *settingModel = [SettingModel new];
    settingModel.model = model;
    settingModel.responseSelector = selector;
    settingModel.cellClass = cellClass;
    return settingModel;
}

@end
