//
//  SwitchSettingCell.h
//  CodeDemo
//
//  Created by tuyw on 2024/2/7.
//

#import <UIKit/UIKit.h>
#import "SettingProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SwitchSettingModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle;
@property (nonatomic, assign) BOOL isOpen;

+ (SwitchSettingModel *)title:(NSString *)title subtitle:(nullable NSString *)subtitle isOpen:(BOOL)isOpen;

@end

@interface SwitchSettingCell : UITableViewCell <SettingCellProtocol>

- (void)updateSwitch:(BOOL)isOn;

@end

NS_ASSUME_NONNULL_END
