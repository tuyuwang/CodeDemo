//
//  SettingProtocol.h
//  CodeDemo
//
//  Created by tuyw on 2024/2/7.
//

#import <UIKit/UIKit.h>

#ifndef SettingProtocol_h
#define SettingProtocol_h

@protocol SettingCellEventProtocol <NSObject>

@optional
- (void)cell:(UITableViewCell *)cell didSelected:(NSIndexPath *)indexPath parameters:(id)parameters;

@end

@protocol SettingModelProtocol <NSObject>

- (Class)cellClass;
- (SEL)responseSelector;
- (id)model;

@end

@protocol SettingCellProtocol <NSObject>

- (void)setDataSource:(id)dataSource;

@optional
- (void)setEventDelegate:(id<SettingCellEventProtocol>)eventDelegate;
- (void)setIndexPath:(NSIndexPath *)indexPath;

@end

@protocol SettingPresenterProtocol <SettingCellEventProtocol>

- (NSArray<NSArray<id<SettingModelProtocol>> *> *)dataSource;
- (UIEdgeInsets)separatorInset;
- (NSString *)title;

@end

#endif /* SettingProtocol_h */
