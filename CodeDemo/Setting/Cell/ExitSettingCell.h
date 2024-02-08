//
//  ExitSettingCell.h
//  CodeDemo
//
//  Created by tuyw on 2024/2/7.
//

#import <UIKit/UIKit.h>
#import "SettingProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExitSettingModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong, nullable) UIColor *titleColor;

+ (ExitSettingModel *)title:(NSString *)title color:(nullable UIColor *)color;

@end

@interface ExitSettingCell : UITableViewCell <SettingCellProtocol>

@end

NS_ASSUME_NONNULL_END
