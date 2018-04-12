//
//  RSViewController.m
//  RSViewControllerAlertView
//
//  Created by Ratul Sharker on 3/29/16.
//

#import "RSDirectVC.h"
#import "RSCustomAlert.h"


@interface RSDirectVC ()

@end

@implementation RSDirectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //
    //  this will actually hide the topmost root UINavigationController
    //
    self.navigationController.navigationBarHidden = YES;
}


#pragma mark IBActions
-(IBAction)onShowCustomAlert:(id)sender
{
    NSLog(@"show on");
    RSCustomAlert *myAlert = (RSCustomAlert*) [RSCustomAlert makeAnAlert:@"custom_alert"];
    [myAlert showOn:self WithAnimation:PredefinedAnimation_ShowWithDamping];
}

-(IBAction)onShowOnTopOfTabbar:(id)sender
{
    RSCustomAlert *myAlert = (RSCustomAlert*) [RSCustomAlert makeAnAlert:@"custom_alert"];
    [myAlert showOn:self.parentViewController WithAnimation:PredefinedAnimation_ShowWithDamping];
    
    [myAlert hideAutomaticallyAfter:3.0 withAnimation:PredefinedAnimation_HideWithDamping onComplete:^{
        NSLog(@"hiding done");
    }];
}

-(IBAction)onPushAVCOnRootNavPressed:(id)sender
{
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"on_root_push_vc"];
    UINavigationController *rootNav = (UINavigationController*)self.parentViewController.parentViewController;
    
    [rootNav pushViewController:viewController animated:YES];
}


@end
