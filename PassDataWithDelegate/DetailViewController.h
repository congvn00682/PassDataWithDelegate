//
//  ViewController.h
//  PassDataWithDelegate
//
//  Created by Vu Ngoc Cong on 6/27/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailViewControllerDelegate <NSObject>

-(void)passData: (NSString*)text;

@end

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property NSString *name;
@property (weak, nonatomic) id<DetailViewControllerDelegate> delegate;

@end

