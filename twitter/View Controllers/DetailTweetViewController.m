//
//  DetailTweetViewController.m
//  twitter
//
//  Created by Jessica Shu on 7/6/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "DetailTweetViewController.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"
@interface DetailTweetViewController ()

@end

@implementation DetailTweetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.userNameLabel.text = @"wat";
    // Do any additional setup after loading the view.
    [self refreshData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTweet:(Tweet *)tweet{
    _tweet = tweet;
    [self refreshData];
    
}

- (IBAction)didTapRetweet:(id)sender {
    [self.tweet toggleRetweet];
    [self refreshData];
    if (self.tweet.retweeted){
        [[APIManager shared] retweetWithCompletion:self.tweet completion:^(Tweet * tweet, NSError * error) {
            if(error){
                NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else {
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            }
        }];
    }
    else {
        [[APIManager shared] unretweetWithCompletion:self.tweet completion:^(Tweet * tweet, NSError * error) {
            if(error){
                NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
            }
            else {
                NSLog(@"Successfully unretweeting the following Tweet: %@", tweet.text);
            }
        }];
    }
}

- (IBAction)didTapFavorite:(id)sender {
    // TODO: Update the local tweet model
    [self.tweet toggleFavorite];
    // TODO: Update cell UI
    [self refreshData];
    // TODO: Send a POST request to the POST favorites/create endpoint
    if (self.tweet.favorited){
        [[APIManager shared] favoriteTweetWithCompletion:self.tweet completion:^(Tweet * tweet, NSError * error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else {
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    else {
        [[APIManager shared] unfavoriteTweetWithCompletion:self.tweet completion:^(Tweet * tweet, NSError * error) {
            if(error){
                NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else {
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
            
        }];
    }
}

-(void)refreshData{
    self.userNameLabel.text = self.tweet.user.name;
    self.userScreenNameLabel.text = [NSString stringWithFormat:@"@%@", self.tweet.user.screenName];
    self.createdAtLabel.text = self.tweet.createdAtString;
    self.tweetTextLabel.text = self.tweet.text;
    // self.replyLabel =
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    self.favoriteCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    [self.profileImageView setImageWithURL:[NSURL URLWithString:self.tweet.user.profileImageString]];
    
    // favorite button
    if (self.tweet.favorited){
        [self.favoriteButton setSelected:YES];
    }
    else {
        [self.favoriteButton setSelected:NO];
    }
    
    // retweet button
    if (self.tweet.retweeted){
        [self.retweetButton setSelected:YES];
    }
    else {
        [self.retweetButton setSelected:NO];
    }

    // reply button
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
