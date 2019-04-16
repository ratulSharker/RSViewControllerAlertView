//
//  RSPushedVC.m
//  RSViewControllerAlertView
//
//  Created by Ratul Sharker on 3/29/16.
//

#import "RSPushedVC.h"
#import "RSCustomAlert.h"

@interface RSPushedVC ()

@end

@implementation RSPushedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setTranslucent:NO];
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

#pragma mark IBAction
-(IBAction)showOnTopOfPushedVCPressed:(id)sender
{
    RSCustomAlert *myAlert = (RSCustomAlert*) [RSCustomAlert makeAnAlert:@"custom_alert"];
    [myAlert showOn:self WithAnimation:PredefinedAnimation_ShowWithFadeIn];
}

-(IBAction)showOnTopOfNavigationOfPushedVCPressed:(id)sender
{
    RSCustomAlert *myAlert = (RSCustomAlert*) [RSCustomAlert makeAnAlert:@"custom_alert"];
    [myAlert showOn:self.parentViewController WithAnimation:PredefinedAnimation_ShowWithFadeIn];
}

-(IBAction)showOnTopOfTabbarControllerPressed:(id)sender
{
    RSCustomAlert *myAlert = (RSCustomAlert*) [RSCustomAlert makeAnAlert:@"custom_alert"];
    [myAlert showOn:self.parentViewController.parentViewController WithAnimation:PredefinedAnimation_ShowWithFadeIn];
}

@end
