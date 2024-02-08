//
//  AvatarSettingCell.h
//  CodeDemo
//
//  Created by tuyw on 2024/2/8.
//

#import <UIKit/UIKit.h>
#import "SettingProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AvatarSettingModel: NSObject

@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle;

+ (AvatarSettingModel *)title:(NSString *)title avatar:(NSString *)avatar subtitle:(nullable NSString *)subtitle;

@end

@interface AvatarSettingCell : UITableViewCell <SettingCellProtocol>

@end

NS_ASSUME_NONNULL_END
