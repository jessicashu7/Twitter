//
//  ProfileViewController.m
//  twitter
//
//  Created by Jessica Shu on 7/5/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIImageView+AFNetworking.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bannerImageView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetsLabel;


@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self refreshData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUser:(User *)user{
    _user = user;
    [self refreshData];
    
    
}
-(void)refreshData{
    //NSLog(@"refresh data called");
    [self.bannerImageView setImageWithURL:[NSURL URLWithString:self.user.bannerImageString]];
    [self.profileImageView
     setImageWithURL:[NSURL URLWithString:self.user.profileImageString]];
    self.nameLabel.text = self.user.name;
        self.screenNameLabel.text = [NSString stringWithFormat:@"@%@", self.user.screenName];
    self.followingLabel.text = [NSString stringWithFormat:@"%d Following",self.user.following];
    self.followersLabel.text = [NSString stringWithFormat:@"%d Followers",self.user.followers];
    self.tweetsLabel.text = [NSString stringWithFormat:@"%d Tweets",self.user.tweets];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
