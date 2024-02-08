//
//  SampleSettingCell.h
//  CodeDemo
//
//  Created by tuyw on 2024/2/7.
//

#import <UIKit/UIKit.h>
#import "SettingProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SampleSettingModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL hideAccessory;
@property (nonatomic, copy) NSString *accessoryTitle;

+ (SampleSettingModel *)title:(NSString *)title;
+ (SampleSettingModel *)title:(NSString *)title accessory:(nullable NSString *)accessoryTitle;

@end

@interface SampleSettingCell : UITableViewCell <SettingCellProtocol>

@end

NS_ASSUME_NONNULL_END
