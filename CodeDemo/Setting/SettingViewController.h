//
//  SettingViewController.h
//  CodeDemo
//
//  Created by tuyw on 2024/2/7.
//

#import <UIKit/UIKit.h>
#import "SettingProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingViewController : UITableViewController

- (void)setPresenter:(id<SettingPresenterProtocol>)presenter;

@end

NS_ASSUME_NONNULL_END
