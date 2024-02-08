//
//  ProtocolSettingCell.h
//  CodeDemo
//
//  Created by tuyw on 2024/2/8.
//

#import <UIKit/UIKit.h>
#import "SettingProtocol.h"

@import YYModel;

NS_ASSUME_NONNULL_BEGIN

@interface ProtocolSettingItemModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, copy) NSString *link;


@end

@interface ProtocolSettingModel : NSObject <YYModel>

@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) NSArray<ProtocolSettingItemModel *> *list;

@end

@interface ProtocolSettingCell : UITableViewCell <SettingCellProtocol>

@end

NS_ASSUME_NONNULL_END
