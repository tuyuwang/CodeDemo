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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SettingViewController *settingViewController = [[SettingViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [settingViewController setPresenter:[TaobaoSettingPresenter dataFromJson:YES]];
    [self.navigationController pushViewController:settingViewController animated:YES];
}


@end
