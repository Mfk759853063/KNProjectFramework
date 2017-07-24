//
//  HZKNTableViewCell.m
//  HuiXianxia
//
//  Created by hzdlapple2 on 15/11/19.
//  Copyright © 2015年 com.huixianxia.c. All rights reserved.
//

#import "KNBaseTableViewCell.h"
#import "KNMacroDefines.h"
#import "Masonry.h"
#import "UIColor+KNAddtions.h"

@interface KNBaseTableViewCell()

@property (assign, nonatomic) BOOL hiddenTopLine;

@property (assign, nonatomic) BOOL hiddenBottomLine;

@property (strong, nonatomic) UIView *topLineView;
//@property (strong, nonatomic) UIView *bottomLineView;

@end



@implementation KNBaseTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.hiddenTopLine = YES;
    self.bounds = CGRectMake(0, 0, KNSCREENWIDTH, CGRectGetHeight(self.bounds));
    self.contentView.frame = self.bounds;

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.hiddenTopLine = YES;
        self.bounds = CGRectMake(0, 0, KNSCREENWIDTH, CGRectGetHeight(self.bounds));
        self.contentView.frame = self.bounds;
    }
    return self;
}

- (void)showTopline:(BOOL)show {
    [self layoutIfNeeded];
    self.topLineView.hidden = !show;
    self.hiddenTopLine = !show;
}

- (void)showToplineLeftOffset:(CGFloat)leftOffset {
    [self layoutIfNeeded];
    [self.topLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(leftOffset);
    }];
}

- (void)showTopLineRightOffSet:(CGFloat)rightOffset {
    [self layoutIfNeeded];
    [self.topLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(rightOffset);
    }];
}

- (void)showBottomLine:(BOOL)show {
    self.bottomLineView.hidden = !show;
    self.hiddenBottomLine = !show;
}

- (void)showBottomLineLeftOffset:(CGFloat)leftOffset {
    [self layoutIfNeeded];
    [self.bottomLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(leftOffset);
    }];
}

- (void)showBottomLineRightOffSet:(CGFloat)rightOffset {
    [self layoutIfNeeded];
    [self.bottomLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(rightOffset);
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 使用默认style
    UITableView *tableView = [self getTableView];
    if (tableView && [tableView isKindOfClass:[UITableView class]]) {
        NSIndexPath *indexPath = [tableView indexPathForRowAtPoint:self.center];
        BOOL showTopLine,showBottomLine;
        if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
            showTopLine = YES;
            showBottomLine = YES;
        } else if (indexPath.row == 0) {
            showTopLine = YES;
            showBottomLine = YES;
        } else {
            showTopLine = NO;
            showBottomLine = YES;
        }
        self.topLineView.hidden = self.topLineView.hidden? YES:!showTopLine;
        self.bottomLineView.hidden = self.bottomLineView.hidden?YES:!showBottomLine;
    }
    if (self.hiddenBottomLine) {
        self.bottomLineView.hidden = YES;
    } else {
        self.bottomLineView.hidden = NO;
    }
    if (self.hiddenTopLine) {
        self.topLineView.hidden = YES;
    } else {
        self.topLineView.hidden = NO;
    }
}

- (UITableView *)getTableView {
    id view = [self superview];
    
    while (view && [view isKindOfClass:[UITableView class]] == NO) {
        view = [view superview];
    }
    
    UITableView *tableView = (UITableView *)view;
    return tableView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

#pragma mark - getter && setter
- (UIView *)topLineView
{
    if (!_topLineView) {
        _topLineView = [[UIView alloc] init];
        [self addSubview:_topLineView];
        [_topLineView setBackgroundColor:KNCOLOR(224, 241, 238, 1)];
        [_topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.and.top.equalTo(self);
            make.height.equalTo(@(KNSINGLE_LINE_WIDTH));
        }];
    }
    return _topLineView;
}

- (UIView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        [self addSubview:_bottomLineView];
        [_bottomLineView setBackgroundColor:KNCOLOR(224, 241, 238, 1)];
        [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.and.bottom.equalTo(self);
            make.height.equalTo(@(KNSINGLE_LINE_WIDTH));
        }];
    }
    return _bottomLineView;
}

@end
