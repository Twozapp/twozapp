//
//  ProfileOneViewController.h
//  Twozapp
//
//  Created by Priya on 09/01/16.
//  Copyright © 2016 Priya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileOneViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UIImageView *imgGMale;
@property (weak, nonatomic) IBOutlet UIImageView *imgGfemale;
@property (weak, nonatomic) IBOutlet UIImageView *imgLMale;
@property (weak, nonatomic) IBOutlet UIImageView *imgLFemale;
@property (weak, nonatomic) IBOutlet UITextField *txtWeight;
@property (weak, nonatomic) IBOutlet UITextField *txtHeight;
@property (weak, nonatomic) IBOutlet UITableView *tblday;
@property (weak, nonatomic) IBOutlet UITableView *tblTime;
@property (weak, nonatomic) IBOutlet UITableView *tblMonth;
@property (weak, nonatomic) IBOutlet UITableView *tblYear;
@property (weak, nonatomic) IBOutlet UILabel *lblDay;
@property (weak, nonatomic) IBOutlet UILabel *lblMonth;
@property (weak, nonatomic) IBOutlet UILabel *lblYear;
@property (weak, nonatomic) IBOutlet UILabel *lblBirthday;
- (IBAction)actionDay:(id)sender;
- (IBAction)actionTime:(id)sender;
- (IBAction)actionMonth:(id)sender;
- (IBAction)actionyear:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *leftBarBtn;
- (IBAction)actionGMale:(id)sender;
- (IBAction)actionGFemale:(id)sender;
- (IBAction)actionLMale:(id)sender;
- (IBAction)actionLFemale:(id)sender;
- (IBAction)actionNext:(id)sender;

@end
