//
//  SettingJsonModel.m
//  CodeDemo
//
//  Created by tuyw on 2024/2/8.
//

#import "SettingJsonModel.h"

@implementation SettingJsonWrapperModel

+ (Class)modelCustomClassForDictionary:(NSDictionary *)dictionary {
    
    if (dictionary[@"modelClass"]) {
        return NSClassFromString(dictionary[@"modelClass"]);
    }
    return nil;
}

@end

@implementation SettingJsonModel

@end
