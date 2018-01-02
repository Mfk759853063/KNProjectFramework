//
//  SHNormalCell.h
//  Backhome
//
//  Created by kwep_vbn on 2017/3/31.
//  Copyright © 2017年 SmartHome. All rights reserved.
//

#import "KNBaseTableViewCell.h"
#import "KNTextView.h"
#import "KNTextField.h"

@protocol KNCommonCellDelegate <NSObject>

@optional
// textView 文字变化
- (void)commonCell:(UITableViewCell *)cell textViewDidChangeText:(NSString *)text;

// switch 值变化
- (void)commonCell:(UITableViewCell *)cell switchChanged:(UISwitch *)switchControl;

// 按钮被点击
- (void)commonCell:(UITableViewCell *)cell choooseButtonTaped:(UIButton *)chooseButton;

// textField 文字变化
- (void)commonCell:(UITableViewCell *)cell textFieldDidChangeText:(NSString *)text;

@end

typedef enum : NSUInteger {
    // 只有title
    KNNormalCellTypeTitle = 1,
    // 水平的titleLabel valueLabel
    KNNormalCellTypeHTitleValue,
    // 垂直的titleLabel valueLabel
    KNNormalCellTypeVTitleValue,
    // 带开关
    KNNormalCellTypeSwitch,
    // 带开关 和 图片
    KNNormalCellTypeButtonSwitch,
    // title 和 textView
    KNNormalCellTypeTitleTextView,
    // title 和 textField
    KNNormalCellTypeTitleTextField,
    // title 和 button
    KNNormalCellTypeChooseButtonTitle,
    // title 和 button valueLabel
    KNNormalCellTypeChooseButtonTitleValue,
} KNNormalCellType;

@interface KNCommonCell : KNBaseTableViewCell

@property (weak, nonatomic) id <KNCommonCellDelegate> delegate;

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) UILabel *valueLabel;

@property (strong, nonatomic) UIButton *chooseButton;

@property (strong, nonatomic) UIImageView *accImageView;

@property (strong, nonatomic) UISwitch *switchControl;

@property (strong, nonatomic) KNTextField *textField;

@property (strong, nonatomic) KNTextView *textView;

@property (weak, nonatomic) UITableView *tableView;

+ (instancetype)configCellWithType:(KNNormalCellType)type tableView:(UITableView *)table;

- (void)configTextViewText:(NSString *)text;

@end
