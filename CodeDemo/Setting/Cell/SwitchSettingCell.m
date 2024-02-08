//
//  SwitchSettingCell.m
//  CodeDemo
//
//  Created by tuyw on 2024/2/7.
//

#import "SwitchSettingCell.h"
@import Masonry;

@implementation SwitchSettingModel

+ (SwitchSettingModel *)title:(NSString *)title subtitle:(NSString *)subtitle isOpen:(BOOL)isOpen {
    SwitchSettingModel *model = [SwitchSettingModel new];
    model.title = title;
    model.subtitle = subtitle;
    model.isOpen = isOpen;
    return model;
}

@end

@interface SwitchSettingCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UISwitch *switchView;
@property (nonatomic, weak) id<SettingCellEventProtocol> eventDelegate;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation SwitchSettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.inset(12.f);
            make.top.inset(15.f);
            make.bottom.inset(15.f).priorityMedium();
        }];
        
        [self.contentView addSubview:self.switchView];
        [self.switchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.inset(12.f);
            make.centerY.equalTo(self.titleLabel);
        }];
        
    }
    return self;
}

- (void)setDataSource:(id)dataSource {
    NSParameterAssert([dataSource isKindOfClass:SwitchSettingModel.class]);
    SwitchSettingModel *model = dataSource;
    self.titleLabel.text = model.title;
    self.switchView.on = model.isOpen;
    
    if (model.subtitle) {
        if (!self.subtitleLabel.superview) {
            [self.contentView addSubview:self.subtitleLabel];
            [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleLabel.mas_bottom).offset(12.f);
                make.leading.trailing.inset(12.f);
                make.bottom.inset(15.f);
            }];
            
            self.subtitleLabel.text = model.subtitle;
        }
    } else {
        [_subtitleLabel removeFromSuperview];
    }
    
}

- (void)updateSwitch:(BOOL)isOn {
    [self.switchView setOn:isOn animated:YES];
}

- (void)switchChange:(UISwitch *)sender {
    if ([self.eventDelegate respondsToSelector:@selector(cell:didSelected:parameters:)]) {
        [self.eventDelegate cell:self didSelected:self.indexPath parameters:@(sender.on)];
    }
}

#pragma mark - Lazy load

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _titleLabel;
}

- (UILabel *)subtitleLabel {
    if (!_subtitleLabel) {
        _subtitleLabel = [UILabel new];
        _subtitleLabel.font = [UIFont systemFontOfSize:14];
        _subtitleLabel.textColor = UIColor.lightGrayColor;
        _subtitleLabel.numberOfLines = 0;
    }
    return _subtitleLabel;
}

- (UISwitch *)switchView {
    if (!_switchView) {
        _switchView = [UISwitch new];
        _switchView.onTintColor = [UIColor colorWithRed:255/255.0f green:102/255.0 blue:0/255.0 alpha:1.0];
        [_switchView addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}
@end
