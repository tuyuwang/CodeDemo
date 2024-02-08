//
//  ProtocolSettingCell.m
//  CodeDemo
//
//  Created by tuyw on 2024/2/8.
//

#import "ProtocolSettingCell.h"
@import YYText;
@import Masonry;

@implementation ProtocolSettingItemModel


@end

@implementation ProtocolSettingModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
        @"list": ProtocolSettingItemModel.class
    };
}

@end

@interface ProtocolSettingCell ()

@property (nonatomic, strong) YYLabel *titleLabel;
@property (nonatomic, weak) id<SettingCellEventProtocol> eventDelegate;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation ProtocolSettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.inset(8.f);
            make.centerX.inset(0.f);
        }];
    }
    return self;
}

- (void)setDataSource:(id)dataSource {
    NSParameterAssert([dataSource isKindOfClass:ProtocolSettingModel.class]);
    ProtocolSettingModel *model = dataSource;
    self.titleLabel.attributedText = [self getTitleList:model];
    
}

- (void)layoutSubviews {
    if (!self.titleLabel.preferredMaxLayoutWidth) {
        self.titleLabel.preferredMaxLayoutWidth = self.bounds.size.width - 12.f * 2;
    }
}

#pragma mark - Private

- (NSAttributedString *)getTitleList:(ProtocolSettingModel *)model {
    NSMutableString *list = [[NSMutableString alloc] init];
    UIColor *listColor = model.titleColor;
    
    [model.list enumerateObjectsUsingBlock:^(ProtocolSettingItemModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [list appendString:obj.title];
    }];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:list attributes:@{
        NSForegroundColorAttributeName: listColor ?: UIColor.blueColor,
        NSFontAttributeName: self.titleLabel.font
    }];
    
    [model.list enumerateObjectsUsingBlock:^(ProtocolSettingItemModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSRange range = [list rangeOfString:obj.title];
        [string yy_setTextHighlightRange:range color:obj.titleColor backgroundColor:nil tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            if ([self.eventDelegate respondsToSelector:@selector(cell:didSelected:parameters:)]) {
                [self.eventDelegate cell:self didSelected:self.indexPath parameters:obj.link];
            }
        }];
    }];
    
    
    return string.copy;
}

#pragma mark - Lazy load

- (YYLabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [YYLabel new];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}

@end
