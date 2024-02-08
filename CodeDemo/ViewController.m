//
//  ViewController.m
//  CodeDemo
//
//  Created by tuyw on 2024/2/7.
//

#import "ViewController.h"
#import "SettingViewController.h"
#import "DriverSettingPresenter.h"
#import "UserSettingPresenter.h"
#import "TaobaoSettingPresenter.h"

@interface DemoItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) SEL selector;

@end

@implementation DemoItem

+ (DemoItem *)title:(NSString *)title selector:(SEL)selector {
    DemoItem *item = [DemoItem new];
    item.title = title;
    item.selector = selector;
    return item;
}

@end

@interface ViewController ()

@property (nonatomic, copy) NSArray<DemoItem *> *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataSource = @[
        [DemoItem title:@"用户-设置" selector:@selector(userSetting)],
        [DemoItem title:@"司机-设置" selector:@selector(driverSetting)],
        [DemoItem title:@"淘宝-code-设置" selector:@selector(taobaoCodeSetting)],
        [DemoItem title:@"淘宝-json-设置" selector:@selector(taobaoJsonSetting)],
    ];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row].title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SEL selector = self.dataSource[indexPath.row].selector;
    if ([self respondsToSelector:selector]) {
        [self performSelector:selector];
    }
}

#pragma mark - Click

- (void)userSetting {
    SettingViewController *settingViewController = [[SettingViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [settingViewController setPresenter:[UserSettingPresenter new]];
    [self.navigationController pushViewController:settingViewController animated:YES];
}

- (void)driverSetting {
    SettingViewController *settingViewController = [[SettingViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [settingViewController setPresenter:[DriverSettingPresenter new]];
    [self.navigationController pushViewController:settingViewController animated:YES];
}

- (void)taobaoCodeSetting {
    SettingViewController *settingViewController = [[SettingViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [settingViewController setPresenter:[TaobaoSettingPresenter dataFromJson:NO]];
    [self.navigationController pushViewController:settingViewController animated:YES];
}

- (void)taobaoJsonSetting {
    SettingViewController *settingViewController = [[SettingViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [settingViewController setPresenter:[TaobaoSettingPresenter dataFromJson:YES]];
    [self.navigationController pushViewController:settingViewController animated:YES];
}

@end
