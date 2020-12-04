//
//  CharlesCustomInputAlertView.m
//  NXXONE
//
//  Created by charles Mac pro on 2020/6/29.
//  Copyright © 2020 weiqitong. All rights reserved.
//

#import "CharlesCustomInputAlertView.h"

@interface CharlesCustomInputAlertView ()

@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@property (weak, nonatomic) IBOutlet UIButton *btnOne;

@property (weak, nonatomic) IBOutlet UIButton *btnTwo;

///动画前的位置
@property (nonatomic, assign) CGAffineTransform starTransForm;

@end

@implementation CharlesCustomInputAlertView

- (void)setTitleLabelText:(NSString *)titleLabelText{
    _titleLabelText = titleLabelText;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [_btnOne setTitle:XFText(@"取消") forState:0];
    
    [_btnTwo setTitle:XFText(@"确认") forState:0];
     
    _inputTextField.attributedPlaceholder = [InfoHelp coustmTextFiledHolderWithplaceholder:NSLocalizedString(@"请输入密码", nil) placeholderColor:kGlobalGreyTextColor];
}

- (instancetype)initCharlesCustomInputAlertViewWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil][0];
        self.frame = frame;
        
    }
    return self;
}

- (IBAction)eventClick:(UIButton *)sender {
    switch (sender.tag) {
        case 1000:
            [self hideView];
            break;
            
        case 1001:
//            if (_inputKeyboardType == InputKeyboardPayPassWord) {
//                if (_inputTextField.text.length == 0) {
//                    XFShowMessage(@"交易密码不能为空");
//                    return;
//                }
//            }else if (_inputKeyboardType == InputKeyboardAmount && _inputTextField.text.length == 0){
//                XFShowMessage(@"输入数量不能为空");
//                return;
//            }
            if ([self.delegate respondsToSelector:@selector(sureCharlesCustomInput:)]) {
                [self.delegate sureCharlesCustomInput:_inputTextField.text];
            }
            [self hideView];
            break;
            
    }
}

#pragma mark - 弹出
- (void)inputAlertViewShow{
    WeakSelf
    _starTransForm = CGAffineTransformMakeScale(0.01, 0.01);
    _bgView.transform = _starTransForm;
    _titleLabel.text = XFText(self.titleLabelText);
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [_inputTextField becomeFirstResponder];
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        weakSelf.bgView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hideView];
}

#pragma mark - 关闭弹框
- (void)hideView{
    WeakSelf
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.bgView.transform = weakSelf.starTransForm;
    } completion:^(BOOL finished) {
        [weakSelf.bgView removeFromSuperview];
        [weakSelf removeFromSuperview];
    }];
}

@end
