//
//  RSPresentedVC.m
//  RSViewControllerAlertView
//
//  Created by Ratul Sharker on 3/29/16.
//

#import "RSPresentedVC.h"
#import "RSCustomAlert.h"

@interface RSPresentedVC ()

@end

@implementation RSPresentedVC

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

#pragma mark IBAction
-(IBAction)onDonePressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)onShowOnTopOfPresentedVCPressed:(id)sender
{
    RSCustomAlert *myAlert = (RSCustomAlert*) [RSCustomAlert makeAnAlert:@"custom_alert"];
    [myAlert showOn:self WithAnimation:PredefinedAnimation_ShowWithFadeIn];
}

-(IBAction)onShowOnTopOfNavigationOfPresentedVCPressed:(id)sender
{
    RSCustomAlert *myAlert = (RSCustomAlert*) [RSCustomAlert makeAnAlert:@"custom_alert"];
    [myAlert showOn:self.parentViewController WithAnimation:PredefinedAnimation_ShowWithDamping];
}


@end
