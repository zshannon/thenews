//
//  TNFormViewController.m
//  The News
//
//  Created by Tosin Afolabi on 20/02/2014.
//  Copyright (c) 2014 Tosin Afolabi. All rights reserved.
//

#import "TNTextField.h"
#import "TNFormViewController.h"
#import "TNHomeViewController.h"

int passwordLengthMin = 6;

@interface TNFormViewController ()

@end

@implementation TNFormViewController

- (void)checkField:(TNTextField *)textField
{
    NSUInteger tag = [textField tag];
    NSUInteger inputLength = [[textField text] length];

    switch (tag) {

        case TNTextFieldTypeName:
            if  (inputLength == 0) {
                [textField setPlaceholderColor:[UIColor redColor]];
                validNameField = NO;
            } else {
                validNameField = YES;
            }
            break;

        case TNTextFieldTypeEmail:
            if (![self validateEmail:[textField text]] || inputLength == 0) {
                [textField setTextColor:[UIColor redColor]];
                [textField setPlaceholderColor:[UIColor redColor]];
                validEmailField = NO;
            } else {
                self.username = textField.text;
                [self resetTextField:self.usernameField];
                validEmailField = YES;
            }
            break;

        case TNTextFieldTypePassword:
            if (inputLength < passwordLengthMin) {
                [textField setTextColor:[UIColor redColor]];
                [textField setPlaceholderColor:[UIColor redColor]];
                validPasswordField = NO;
            } else {
                self.password = textField.text;
                [self resetTextField:self.passwordField];
                validPasswordField = YES;
            }
            break;
    }
}

- (void)checkAllFields
{
    [self checkField:self.nameField];
    [self checkField:self.usernameField];
    [self checkField:self.passwordField];
}

- (void)resetTextField:(TNTextField *)textField
{
    UIColor *defaultColor = [UIColor colorWithRed:0.780 green:0.780 blue:0.804 alpha:1];
    [textField setPlaceholderColor:defaultColor];
    [textField setTextColor:[UIColor blackColor]];
}


- (void)pushHomeView
{
    TNHomeViewController *homeViewController = [[TNHomeViewController alloc] init];
    [self.navigationController pushViewController:homeViewController animated:YES];

    // Remove Launch & Registration View Controllers No Longer Accessible
    NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    [self.navigationController setViewControllers:@[[viewControllers lastObject]]];
}

- (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *regexPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [regexPredicate evaluateWithObject:email];
}

- (void)fadeInAnimation:(UIView *)view
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 0.5f;
    transition.delegate = self;
    [view.layer addAnimation:transition forKey:@"kCATransitionFade"];
}

@end
