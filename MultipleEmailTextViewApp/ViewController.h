//
//  ViewController.h
//  MultipleEmailTextViewApp
//
//  Created by Chetu India on 20/04/16.
//  Copyright © 2016 Chetu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLTokenInputView.h"
#import "CLToken.h"


@interface ViewController : UIViewController <CLTokenInputViewDelegate>

@property (strong, nonatomic) IBOutlet CLTokenInputView *tokenInputView;

@property (strong, nonatomic) NSMutableArray *selectedNames;

@end

