CYAlertView
===========

1. Block support for AlertView

```
@interface CYAlertView : UIAlertView

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
         clickedBlock:(void (^)(CYAlertView *alertView, BOOL cancelled, NSInteger buttonIndex))clickedBlock
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;
  
@end
```

2. Sample code for [Variable Argument Lists](http://gracelancy.com/blog/2014/05/05/variable-argument-lists/)
