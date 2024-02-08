//
//  ExitSettingCell.m
//  CodeDemo
//
//  Created by tuyw on 2024/2/7.
//

#import "ExitSettingCell.h"
@import Masonry;

@implementation ExitSettingModel

+ (ExitSettingModel *)title:(NSString *)title color:(UIColor *)color {
    ExitSettingModel *model = [ExitSettingModel new];
    model.title = title;
    model.titleColor = color;
    return model;
}

@end

@interface ExitSettingCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ExitSettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.inset(0.f);
            make.top.bottom.inset(15.f);
        }];
    }
    return self;
}

- (void)setDataSource:(id)dataSource {
    NSParameterAssert([dataSource isKindOfClass:ExitSettingModel.class]);
    ExitSettingModel *model = dataSource;
    self.titleLabel.text = model.title;
    
    if (model.titleColor) {
        self.titleLabel.textColor = model.titleColor;
    }
}


#pragma mark - Lazy load

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:16.f];
    }
    
    return _titleLabel;
}
@end
