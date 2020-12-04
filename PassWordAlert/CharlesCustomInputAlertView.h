//
//  CharlesCustomInputAlertView.h
//  NXXONE
//
//  Created by charles Mac pro on 2020/6/29.
//  Copyright © 2020 weiqitong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CharlesCustomInputAlertView;

@protocol CharlesCustomInputAlertViewDelegate <NSObject>

/**确定按钮的执行方法*/
- (void)sureCharlesCustomInput:(NSString *)inputContent;

@end

@interface CharlesCustomInputAlertView : UIView

@property (nonatomic,assign) id <CharlesCustomInputAlertViewDelegate>delegate;

@property (nonatomic,strong) NSString *titleLabelText;

- (instancetype)initCharlesCustomInputAlertViewWithFrame:(CGRect)frame;

- (void)inputAlertViewShow;

/*关闭弹框*/
- (void)hideView;

@end

NS_ASSUME_NONNULL_END
