//
//  SettingModel+Constructor.m
//  CodeDemo
//
//  Created by tuyw on 2024/2/8.
//

#import "SettingModel+Constructor.h"
#import "SampleSettingCell.h"
#import "SwitchSettingCell.h"
#import "ExitSettingCell.h"
#import "AvatarSettingCell.h"
#import "ProtocolSettingCell.h"

@implementation SettingModel (Constructor)

+ (SettingModel *)sampleCell:(NSString *)title selector:(SEL)selector {
    return [self cell:SampleSettingCell.class
                model:[SampleSettingModel title:title]
             selector:selector];
}

+ (SettingModel *)sampleCell:(NSString *)title accessory:(NSString *)accessoryTitle selector:(SEL)selector {
    return [self cell:SampleSettingCell.class
                model:[SampleSettingModel title:title accessory:accessoryTitle]
             selector:selector];
}

+ (SettingModel *)switchCell:(NSString *)title isOpen:(BOOL)isOpen {
    return [self switchCell:title isOpen:isOpen subtitle:nil];
}

+ (SettingModel *)switchCell:(NSString *)title isOpen:(BOOL)isOpen subtitle:(NSString *)subtitle {
    return [self cell:SwitchSettingCell.class
                model:[SwitchSettingModel title:title subtitle:subtitle isOpen:isOpen]
             selector:nil];
}

+ (SettingModel *)exitCell:(NSString *)title selector:(SEL)selector {
    return [self exitCell:title color:nil selector:selector];
}

+ (SettingModel *)exitCell:(NSString *)title color:(UIColor *)color selector:(SEL)selector {
    return [self cell:ExitSettingCell.class
                model:[ExitSettingModel title:title color:color]
             selector:selector];
}

+ (SettingModel *)avaterCell:(NSString *)title avatar:(NSString *)avatar selector:(SEL)selector {
    return [self avaterCell:title avatar:avatar subtitle:nil selector:selector];
}

+ (SettingModel *)avaterCell:(NSString *)title avatar:(NSString *)avatar subtitle:(NSString *)subtitle selector:(SEL)selector {
    return [self cell:AvatarSettingCell.class
                model:[AvatarSettingModel title:title avatar:avatar subtitle:subtitle]
             selector:selector];
}

@end
