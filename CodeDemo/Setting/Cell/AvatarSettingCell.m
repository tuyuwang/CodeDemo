//
//  AvatarSettingCell.m
//  CodeDemo
//
//  Created by tuyw on 2024/2/8.
//

#import "AvatarSettingCell.h"
@import Masonry;
@import SDWebImage;

@implementation AvatarSettingModel

+ (AvatarSettingModel *)title:(NSString *)title avatar:(NSString *)avatar subtitle:(NSString *)subtitle {
    AvatarSettingModel *model = [AvatarSettingModel new];
    model.title = title;
    model.avatar = avatar;
    model.subtitle = subtitle;
    return model;
}

@end

@interface AvatarSettingCell ()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UIImageView *accessoryImageView;
@property (nonatomic, strong) UIStackView *stackView;

@end

@implementation AvatarSettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.avatarImageView];
        [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.top.bottom.inset(16.f);
            make.width.height.mas_equalTo(80.f);
        }];
        
        [self.contentView addSubview:self.accessoryImageView];
        [self.accessoryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.inset(12.f);
            make.centerY.inset(0.f);
        }];
        
        [self.contentView addSubview:self.stackView];
        [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.avatarImageView.mas_right).offset(10.f);
            make.centerY.inset(0.f);
            make.trailing.inset(44.f);
        }];
        
        [self.stackView addArrangedSubview:self.titleLabel];
        
    }
    return self;
}

- (void)setDataSource:(id)dataSource {
    NSParameterAssert([dataSource isKindOfClass:AvatarSettingModel.class]);
    AvatarSettingModel *model = dataSource;
    
    self.titleLabel.text = model.title;
    
    if ([model.avatar hasPrefix:@"http"]) {
        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    } else {
        self.avatarImageView.image = [UIImage imageNamed:model.avatar];
    }
    
    if (model.subtitle) {
        if (!self.subtitleLabel.superview) {
            [self.stackView addArrangedSubview:self.subtitleLabel];
        }
        self.subtitleLabel.text = model.subtitle;
    } else {
        [self.subtitleLabel removeFromSuperview];
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
        _subtitleLabel.textColor = UIColor.grayColor;
    }
    return _subtitleLabel;
}

- (UIImageView *)accessoryImageView {
    if (!_accessoryImageView) {
        _accessoryImageView = [UIImageView new];
        _accessoryImageView.image = [UIImage imageNamed:@"accessory"];
    }
    return _accessoryImageView;
}

- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [UIImageView new];
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
        _avatarImageView.layer.cornerRadius = 40.f;
        _avatarImageView.layer.masksToBounds = YES;
    }
    return _avatarImageView;
}

- (UIStackView *)stackView {
    if (!_stackView) {
        _stackView = [UIStackView new];
        _stackView.axis = UILayoutConstraintAxisVertical;
        _stackView.spacing = 4.f;
        _stackView.distribution = UIStackViewDistributionEqualSpacing;
    }
    return _stackView;
}
@end
