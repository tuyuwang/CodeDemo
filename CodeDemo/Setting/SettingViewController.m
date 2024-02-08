//
//  SettingViewController.m
//  CodeDemo
//
//  Created by tuyw on 2024/2/7.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@property (nonatomic, copy) NSArray<NSArray<id<SettingModelProtocol>> *> *dataSource;
@property (nonatomic, strong) id<SettingPresenterProtocol> presenter;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.presenter.title;
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    
    self.dataSource = self.presenter.dataSource;
}

- (void)setDataSource:(NSArray<NSArray<id<SettingModelProtocol>> *> *)dataSource {
    _dataSource = dataSource;
    [self.tableView reloadData];
}

#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<SettingModelProtocol> model = self.dataSource[indexPath.section][indexPath.row];
    NSString *identifier = NSStringFromClass(model.cellClass);
    
    UITableViewCell<SettingCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[model.cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.separatorInset = self.presenter.separatorInset;
    
    if ([cell respondsToSelector:@selector(setEventDelegate:)] &&
        [cell respondsToSelector:@selector(setIndexPath:)]) {
        [cell setIndexPath:indexPath];
        [cell setEventDelegate:self.presenter];
    }
    
    [cell setDataSource:model.model];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataSource.count > indexPath.section && 
        self.dataSource[indexPath.section].count > indexPath.row) {
        id<SettingModelProtocol> model = self.dataSource[indexPath.section][indexPath.row];
        if ([self.presenter respondsToSelector:model.responseSelector]) {
            [self.presenter performSelector:model.responseSelector withObject:model.model];
        }
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 12.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

#pragma mark - Lazy load


@end
