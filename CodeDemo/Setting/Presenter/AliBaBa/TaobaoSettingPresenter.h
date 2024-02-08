//
//  TaobaoSettingPresenter.h
//  CodeDemo
//
//  Created by tuyw on 2024/2/8.
//

#import <Foundation/Foundation.h>
#import "SettingProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface TaobaoSettingPresenter : NSObject <SettingPresenterProtocol>

+ (TaobaoSettingPresenter *)dataFromJson:(BOOL)fromJson;

@end

NS_ASSUME_NONNULL_END
