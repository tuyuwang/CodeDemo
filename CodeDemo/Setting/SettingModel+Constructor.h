//
//  SettingModel+Constructor.h
//  CodeDemo
//
//  Created by tuyw on 2024/2/8.
//

#import "SettingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingModel (Constructor)

+ (SettingModel *)sampleCell:(NSString *)title selector:(SEL)selector;
+ (SettingModel *)sampleCell:(NSString *)title accessory:(NSString *)accessoryTitle selector:(SEL)selector;
+ (SettingModel *)switchCell:(NSString *)title isOpen:(BOOL)isOpen;
+ (SettingModel *)switchCell:(NSString *)title isOpen:(BOOL)isOpen subtitle:(nullable NSString *)subtitle;
+ (SettingModel *)exitCell:(NSString *)title selector:(SEL)selector;
+ (SettingModel *)exitCell:(NSString *)title color:(nullable UIColor *)color selector:(SEL)selector;
+ (SettingModel *)avaterCell:(NSString *)title avatar:(NSString *)avatar selector:(SEL)selector;
+ (SettingModel *)avaterCell:(NSString *)title avatar:(NSString *)avatar subtitle:(nullable NSString *)subtitle selector:(SEL)selector;

@end

NS_ASSUME_NONNULL_END
