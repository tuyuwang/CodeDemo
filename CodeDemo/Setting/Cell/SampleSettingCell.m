//
//  SampleSettingCell.m
//  CodeDemo
//
//  Created by tuyw on 2024/2/7.
//

#import "SampleSettingCell.h"
@import Masonry;

@implementation SampleSettingModel

+ (SampleSettingModel *)title:(NSString *)title {
    return [self title:title accessory:nil];
}

+ (SampleSettingModel *)title:(NSString *)title accessory:(NSString *)accessoryTitle {
    SampleSettingModel *model = [SampleSettingModel new];
    model.title = title;
    model.accessoryTitle = accessoryTitle;
    return model;
}
@end

@interface SampleSettingCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *accessoryImageView;
@property (nonatomic, strong) UILabel *accessoryLabel;

@end

@implementation SampleSettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.inset(12.f);
            make.bottom.top.inset(15.f);
        }];
        
        [self.contentView addSubview:self.accessoryImageView];
        [self.accessoryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.inset(12.f);
            make.centerY.inset(0.f);
        }];
    }
    return self;
}

- (void)setDataSource:(id)dataSource {
    NSParameterAssert([dataSource isKindOfClass:SampleSettingModel.class]);
    SampleSettingModel *model = dataSource;
    
    self.titleLabel.text = model.title;
    self.accessoryImageView.hidden = model.hideAccessory;
    
    if (model.accessoryTitle) {
        if (!self.accessoryLabel.superview) {
            [self.contentView addSubview:self.accessoryLabel];
            [self.accessoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                if (model.hideAccessory) {
                    make.trailing.equalTo(self.accessoryImageView.mas_trailing);
                } else {
                    make.trailing.equalTo(self.accessoryImageView.mas_leading).inset(4.f);
                }
                make.centerY.equalTo(self.accessoryImageView);
            }];
        }
        self.accessoryLabel.text = model.accessoryTitle;
        
    } else {
        [_accessoryLabel removeFromSuperview];
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

- (UIImageView *)accessoryImageView {
    if (!_accessoryImageView) {
        _accessoryImageView = [UIImageView new];
        _accessoryImageView.image = [UIImage imageNamed:@"accessory"];
        _accessoryImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _accessoryImageView;
}

- (UILabel *)accessoryLabel {
    if (!_accessoryLabel) {
        _accessoryLabel = [UILabel new];
        _accessoryLabel.font = [UIFont systemFontOfSize:16];
        _accessoryLabel.textColor = UIColor.lightGrayColor;
    }
    return _accessoryLabel;
}

@end
