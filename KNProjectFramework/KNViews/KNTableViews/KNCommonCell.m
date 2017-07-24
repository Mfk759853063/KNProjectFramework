//
//  SHNormalCell.m
//  Backhome
//
//  Created by kwep_vbn on 2017/3/31.
//  Copyright © 2017年 SmartHome. All rights reserved.
//

#import "KNCommonCell.h"
#import "Masonry.h"
#import "UILabel+KNConvenient.h"
#import "KNHelperFunctions.h"
#import "KNMacroDefines.h"
#import "UIColor+KNAddtions.h"

#define kTextViewWidth (KNSCREENWIDTH - 14 * 2)
#define kMinContextHeight 32

@interface KNCommonCell ()<UITextFieldDelegate,UITextViewDelegate>

@end

@implementation KNCommonCell

+ (UIImage *)accImage {
    NSBundle *bundle = KN_frameworkBundle();
    return [UIImage imageNamed:@"acc_right" inBundle:bundle compatibleWithTraitCollection:nil];
}

+ (instancetype)configCellWithType:(KNNormalCellType)type tableView:(UITableView *)table {
    NSString *identifier = [NSString stringWithFormat:@"commonCellType-%ld",type];
    KNCommonCell *cell = [table dequeueReusableCellWithIdentifier:identifier];
    if (cell) {
        return cell;
    }
    if (type == KNNormalCellTypeTitle) {
        return [self createTitleCell:identifier];
    } else if (type == KNNormalCellTypeHTitleValue) {
        return [self createHTitleValueCell:identifier];
    } else if (type == KNNormalCellTypeVTitleValue) {
        return [self createVTitleValueCell:identifier];
    } else if (type == KNNormalCellTypeChooseButtonTitle) {
        return [self createChooseButtonTitleCell:identifier];
    } else if (type == KNNormalCellTypeChooseButtonTitleValue) {
        return [self createChooseButtonTitleValueCell:identifier];
    } else if (type == KNNormalCellTypeSwitch) {
        return [self createSwitchCell:identifier];
    } else if (type == KNNormalCellTypeButtonSwitch) {
        return [self createButtonSwitchCell:identifier];
    } else if (type == KNNormalCellTypeTitleTextField) {
        return [self createTitleFieldCell:identifier];
    } else if (type == KNNormalCellTypeTitleTextView) {
        return [self createTitleTextViewCell:identifier];
    }
    return nil;
}

+ (instancetype)createTitleCell:(NSString *)identifier {
    KNCommonCell *cell = [[KNCommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.titleLabel = [UILabel KN_labelWithTextColor:[UIColor blackColor] font:15 lineNumbers:1];
    [cell addSubview:cell.titleLabel];
    UIImage *image = [self accImage];
    cell.accImageView = [[UIImageView alloc] initWithImage:image];
    [cell addSubview:cell.accImageView];
    
    [cell.accImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-14));
        make.centerY.equalTo(cell);
        make.width.equalTo(@(image.size.width));
        make.height.equalTo(@(image.size.height));
    }];
    
    [cell.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cell);
        make.left.equalTo(@(14));
        make.right.equalTo(cell.accImageView.mas_left).offset(-14);
    }];
    return cell;
}

+ (instancetype)createHTitleValueCell:(NSString *)identifier {
    KNCommonCell *cell = [[KNCommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.titleLabel = [UILabel KN_labelWithTextColor:[UIColor blackColor] font:15 lineNumbers:1];
    [cell addSubview:cell.titleLabel];
    
    cell.valueLabel = [UILabel KN_labelWithTextColor:[UIColor grayColor] font:13 lineNumbers:1];
    [cell addSubview:cell.valueLabel];
    
    UIImage *image = [self accImage];
    cell.accImageView = [[UIImageView alloc] initWithImage:image];
    [cell addSubview:cell.accImageView];
    
    [cell.accImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-14));
        make.centerY.equalTo(cell);
        make.width.equalTo(@(image.size.width));
        make.height.equalTo(@(image.size.height));
    }];
    
    [cell.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cell);
        make.left.equalTo(@(14));
        make.right.equalTo(cell.valueLabel.mas_left).offset(-5);
    }];
    
    [cell.titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    [cell.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cell);
        make.right.equalTo(cell.accImageView.mas_left).offset(-14);
    }];
    return cell;
}

+ (instancetype)createVTitleValueCell:(NSString *)identifier {
    KNCommonCell *cell = [[KNCommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.titleLabel = [UILabel KN_labelWithTextColor:[UIColor blackColor] font:15 lineNumbers:1];
    [cell addSubview:cell.titleLabel];
    
    cell.valueLabel = [UILabel KN_labelWithTextColor:[UIColor grayColor] font:13 lineNumbers:1];
    [cell addSubview:cell.valueLabel];
    
    UIImage *image = [self accImage];
    cell.accImageView = [[UIImageView alloc] initWithImage:image];
    [cell addSubview:cell.accImageView];
    
    [cell.accImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-14));
        make.centerY.equalTo(cell);
        make.width.equalTo(@(image.size.width));
        make.height.equalTo(@(image.size.height));
    }];
    
    [cell.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@14);
        make.left.equalTo(@(14));
        make.right.equalTo(cell.accImageView.mas_left).offset(-14);
    }];
    
    [cell.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell.titleLabel.mas_bottom).offset(5);
        make.left.and.right.equalTo(cell.titleLabel);
        make.bottom.equalTo(@(-14));
    }];
    return cell;
}

+ (instancetype)createChooseButtonTitleCell:(NSString *)identifier {
    KNCommonCell *cell = [[KNCommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.titleLabel = [UILabel KN_labelWithTextColor:[UIColor blackColor] font:15 lineNumbers:1];
    [cell addSubview:cell.titleLabel];
    
    cell.chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cell.chooseButton addTarget:cell action:@selector(chooseTaped:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:cell.chooseButton];
    
    UIImage *image = [self accImage];
    cell.accImageView = [[UIImageView alloc] initWithImage:image];
    [cell addSubview:cell.accImageView];
    
    [cell.accImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-14));
        make.centerY.equalTo(cell);
        make.width.equalTo(@(image.size.width));
        make.height.equalTo(@(image.size.height));
    }];
    
    [cell.chooseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@14);
        make.centerY.equalTo(cell);
        make.width.and.height.equalTo(@25);
    }];
    
    [cell.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cell);
        make.left.equalTo(cell.chooseButton.mas_right).offset(14);
        make.right.equalTo(cell.accImageView.mas_left).offset(-14);
    }];
    return cell;
}

+ (instancetype)createChooseButtonTitleValueCell:(NSString *)identifier {
    KNCommonCell *cell = [[KNCommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.titleLabel = [UILabel KN_labelWithTextColor:[UIColor blackColor] font:15 lineNumbers:1];
    [cell addSubview:cell.titleLabel];
    
    cell.valueLabel = [UILabel KN_labelWithTextColor:[UIColor grayColor] font:13 lineNumbers:1];
    [cell addSubview:cell.valueLabel];
    
    cell.chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cell.chooseButton addTarget:cell action:@selector(chooseTaped:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:cell.chooseButton];
    
    UIImage *image = [self accImage];
    cell.accImageView = [[UIImageView alloc] initWithImage:image];
    [cell addSubview:cell.accImageView];
    
    [cell.accImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-14));
        make.centerY.equalTo(cell);
        make.width.equalTo(@(image.size.width));
        make.height.equalTo(@(image.size.height));
    }];
    
    
    [cell.chooseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@14);
        make.centerY.equalTo(cell);
        make.width.and.height.equalTo(@25);
    }];
    
    [cell.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cell);
        make.left.equalTo(cell.chooseButton.mas_right).offset(14);
        make.right.equalTo(cell.valueLabel.mas_left).offset(-5);
    }];
    
    [cell.titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    [cell.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cell);
        make.right.equalTo(cell.accImageView.mas_left).offset(-14);
    }];
    return cell;
}

+ (instancetype)createSwitchCell:(NSString *)identifier {
    KNCommonCell *cell = [[KNCommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.titleLabel = [UILabel KN_labelWithTextColor:[UIColor blackColor] font:15 lineNumbers:1];
    [cell addSubview:cell.titleLabel];
    
    cell.switchControl = [[UISwitch alloc] init];
    [cell.switchControl addTarget:cell action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    cell.switchControl.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.8, 0.8);
    [cell addSubview:cell.switchControl];
    
    [cell.switchControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-14);
        make.centerY.equalTo(cell);
    }];
    
    [cell.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cell);
        make.left.equalTo(@(14));
        make.right.equalTo(cell.switchControl.mas_left).offset(-14);
    }];
    return cell;
}

+ (instancetype)createButtonSwitchCell:(NSString *)identifier {
    KNCommonCell *cell = [[KNCommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cell.chooseButton addTarget:cell action:@selector(chooseTaped:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:cell.chooseButton];
    
    cell.titleLabel = [UILabel KN_labelWithTextColor:[UIColor blackColor] font:15 lineNumbers:1];
    [cell addSubview:cell.titleLabel];
    
    cell.switchControl = [[UISwitch alloc] init];
    [cell.switchControl addTarget:cell action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    cell.switchControl.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.8, 0.8);
    [cell addSubview:cell.switchControl];
    
    [cell.switchControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-14);
        make.centerY.equalTo(cell);
    }];
    
    [cell.chooseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@14);
        make.centerY.equalTo(cell);
        make.width.and.height.equalTo(@25);
    }];
    
    [cell.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cell);
        make.left.equalTo(cell.chooseButton.mas_right).offset(14);
        make.right.equalTo(cell.switchControl.mas_left).offset(-14);
    }];
    return cell;
}

+ (instancetype)createTitleFieldCell:(NSString *)identifier {
    KNCommonCell *cell = [[KNCommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.titleLabel = [UILabel KN_labelWithTextColor:[UIColor blackColor] font:15 lineNumbers:1];
    [cell addSubview:cell.titleLabel];
    
    cell.textField = [[KNTextField alloc] init];
    cell.textField.font = KNFONT(14);
    cell.textField.delegate = cell;
    UIColor *placeColor = [UIColor KN_colorWithHex:0x888888];
    [cell.textField setEditTextFieldPlaceholder:@"请输入内容" color:placeColor];
    [cell.textField setReturnKeyType:UIReturnKeyDone];
    
    cell.textField.layer.cornerRadius= 5.0f;
    cell.textField.font = KNFONT(14);
    cell.textField.textColor = [UIColor blackColor];
    cell.textField.layer.borderColor = [UIColor KN_colorWithHex:0x888888].CGColor;
    cell.textField.layer.borderWidth = 0.5;
    [cell addSubview:cell.textField];
    
    [cell.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@14);
        make.left.equalTo(@(14));
        make.right.equalTo(cell).offset(-14);
    }];
    
    [cell.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell.titleLabel.mas_bottom).offset(10);
        make.left.and.right.equalTo(cell.titleLabel);
        make.height.equalTo(@35);
        make.bottom.equalTo(@(-14));
    }];
    return cell;
}

+ (instancetype)createTitleTextViewCell:(NSString *)identifier {
    KNCommonCell *cell = [[KNCommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.titleLabel = [UILabel KN_labelWithTextColor:[UIColor blackColor] font:15 lineNumbers:1];
    [cell addSubview:cell.titleLabel];
    
    cell.textView = [[KNTextView alloc] init];
    cell.textView.scrollEnabled = NO;
//    cell.textView.textContainerInset = UIEdgeInsetsMake(5, 0, 3, 0);
    cell.textView.font = KNFONT(14);
    cell.textView.delegate = cell;
    UIColor *placeColor = [UIColor KN_colorWithHex:0x888888];
    [cell.textView setMyPlaceholder:@"请输入内容"];
    [cell.textView setMyPlaceholderColor:placeColor];
    
    cell.textView.layer.cornerRadius= 5.0f;
    cell.textView.font = KNFONT(14);
    cell.textView.textColor = [UIColor blackColor];
    cell.textView.layer.borderColor = [UIColor KN_colorWithHex:0x888888].CGColor;
    cell.textView.layer.borderWidth = 0.5;
    [cell addSubview:cell.textView];
    
    [cell.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@14);
        make.left.equalTo(@(14));
        make.right.equalTo(cell).offset(-14);
    }];
    
    [cell.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell.titleLabel.mas_bottom).offset(10);
        make.left.and.right.equalTo(cell.titleLabel);
        make.height.equalTo(@kMinContextHeight);
        make.bottom.equalTo(@(-14));
    }];
    return cell;
}

- (void)configTextViewText:(NSString *)text {
    self.textView.text = text;
    [self setLineSpacing:5 forTextView:self.textView];
    
    CGSize newSize = [self.textView sizeThatFits:CGSizeMake(kTextViewWidth, CGFLOAT_MAX)];
    if (newSize.height < kMinContextHeight) {
        newSize.height = kMinContextHeight;
    }
    [self.textView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(newSize.height));
    }];

    [self.textView updateConstraintsIfNeeded];
    [self.textView layoutIfNeeded];
    [self setNeedsDisplay];
}

#pragma mark - Notification

- (void)textViewDidChange:(KNTextView *)textView {
    
    NSInteger loc = textView.selectedRange.location;
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    //如果在变化中是高亮部分在变，就不计算字符
    if (selectedRange && pos) {
        return;
    }
    
    [self setLineSpacing:5 forTextView:textView];
    if (self.delegate && [self.delegate respondsToSelector:@selector(commonCell:textViewDidChangeText:)]) {
        [self.delegate commonCell:self textViewDidChangeText:textView.text];
    }
    
    CGSize newSize = [textView sizeThatFits:CGSizeMake(kTextViewWidth, CGFLOAT_MAX)];
    if (newSize.height < kMinContextHeight) {
        newSize.height = kMinContextHeight;
    }
    [self.textView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(newSize.height));
    }];
    [self layoutIfNeeded];
    
    textView.selectedRange = NSMakeRange(loc, 0);
    // 让 table view 重新计算高度
    UITableView *tableView = self.tableView;
    if (!tableView) {
        NSLog(@"必须传入tableView");
    }
    [tableView beginUpdates];
    [tableView endUpdates];
    
}

- (void)setLineSpacing:(CGFloat)spacing forTextView:(KNTextView *)textView {
    //    textview 改变字体的行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = spacing;// 字体的行间距
    NSDictionary *attributes = @{
                                 NSFontAttributeName:textView.font,
                                 NSParagraphStyleAttributeName:paragraphStyle,
                                 NSForegroundColorAttributeName:textView.textColor
                                 };
    textView.attributedText = [[NSAttributedString alloc] initWithString:textView.text attributes:attributes];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - textfield delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(commonCell:textFieldDidChangeText:)]) {
        [self.delegate commonCell:self textFieldDidChangeText:textField.text];
    }
}

#pragma mark - action

- (void)chooseTaped:(UIButton *)button {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    if (self.delegate && [self.delegate respondsToSelector:@selector(commonCell:choooseButtonTaped:)]) {
        [self.delegate commonCell:self choooseButtonTaped:button];
    }
}

- (void)switchValueChanged:(UISwitch *)switchControl {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    if (self.delegate && [self.delegate respondsToSelector:@selector(commonCell:switchChanged:)]) {
        [self.delegate commonCell:self switchChanged:switchControl];
    }
}

@end
