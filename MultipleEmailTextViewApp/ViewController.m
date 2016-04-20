//
//  ViewController.m
//  MultipleEmailTextViewApp
//
//  Created by Chetu India on 20/04/16.
//  Copyright © 2016 Chetu. All rights reserved.
//

#import "ViewController.h"


@interface NSString (emailValidation)
- (BOOL)isValidEmail;
@end

@implementation NSString (emailValidation)
-(BOOL)isValidEmail
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}
@end


@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.selectedNames = [[NSMutableArray alloc] init];
    
    // Set border width and color.
    [self.tokenInputView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.tokenInputView.layer setBorderWidth:1.0f];
    
    self.tokenInputView.fieldName = @"";
    self.tokenInputView.placeholderText = @"Enter recipient email address";
}



#pragma mark - CLTokenInputViewDelegate
- (void)tokenInputView:(CLTokenInputView *)view didChangeHeightTo:(CGFloat)height
{
    CGRect newFrame = view.frame;
    newFrame.size.height = 200;
    NSLog(@"%f", newFrame.size.height);
    [view setFrame:newFrame];
    NSLog(@"%f", view.frame.size.height);

    //view.backgroundColor = [UIColor lightGrayColor];
}

- (void)tokenInputView:(CLTokenInputView *)view didChangeText:(NSString *)text
{
    if ([text rangeOfString:@" "].location != NSNotFound) {

        text = [text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if ([text isValidEmail]){
            
            NSLog(@"'%@'", text);
            
            CLToken *token = [[CLToken alloc] initWithDisplayText:text context:nil];
            [self.tokenInputView addToken:token];
        }
    }
    
    if ([text isEqualToString:@""]){
        
    }
    else {

    }
}

- (void)tokenInputView:(CLTokenInputView *)view didAddToken:(CLToken *)token
{
    NSString *name = token.displayText;
    [self.selectedNames addObject:name];
}

- (void)tokenInputView:(CLTokenInputView *)view didRemoveToken:(CLToken *)token
{
    NSString *name = token.displayText;
    [self.selectedNames removeObject:name];
}

- (CLToken *)tokenInputView:(CLTokenInputView *)view tokenForText:(NSString *)text
{
    // TODO: Perhaps if the text is a valid phone number, or email address, create a token
    // to "accept" it.
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
