//
//  SettingJsonModel.h
//  CodeDemo
//
//  Created by tuyw on 2024/2/8.
//

#import <Foundation/Foundation.h>
#import "SettingProtocol.h"
@import YYModel;

NS_ASSUME_NONNULL_BEGIN

@interface SettingJsonWrapperModel : NSObject <YYModel>

@property (nonatomic, strong) Class modelClass;

@end

@interface SettingJsonModel : NSObject <SettingModelProtocol>

@property (nonatomic, strong) Class cellClass;
@property (nonatomic, assign, nullable) SEL responseSelector;
@property (nonatomic, strong) SettingJsonWrapperModel *model;

@end

NS_ASSUME_NONNULL_END
