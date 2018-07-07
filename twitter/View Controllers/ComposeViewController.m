//
//  ComposeViewController.m
//  twitter
//
//  Created by Jessica Shu on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController ()

@property (weak, nonatomic) IBOutlet UITextView *tweetText;

@end

@implementation ComposeViewController

- (IBAction)sendTweet:(id)sender {
    //NSLog(@"send tweet");
    
    [[APIManager shared] postStatusWithText:self.tweetText.text completion:^(Tweet * tweet, NSError * error) {
        if (tweet){
            NSLog(@"Compose Tweet Success!");
            [self.delegate didTweet:tweet];
        }
        else {
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);

        }
        [self dismissViewControllerAnimated:true completion:nil];

    }];
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


