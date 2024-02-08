//
//  SettingModel.h
//  CodeDemo
//
//  Created by tuyw on 2024/2/7.
//

#import <Foundation/Foundation.h>
#import "SettingProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingModel : NSObject <SettingModelProtocol>

@property (nonatomic, strong) Class cellClass;
@property (nonatomic, assign, nullable) SEL responseSelector;
@property (nonatomic, strong) id model;

+ (SettingModel *)cell:(Class)cellClass model:(id)model selector:(nullable SEL)selector;

@end

NS_ASSUME_NONNULL_END
