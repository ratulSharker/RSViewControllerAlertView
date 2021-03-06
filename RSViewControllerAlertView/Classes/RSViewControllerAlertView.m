//
//  RSViewControllerAlertView.m
//
//  Created by Ratul Sharker on 1/28/16.
//
#import <RSViewControllerAlertView/RSViewControllerAlertView.h>

#define VIEWCONTROLLER_TIMER_USERINFO_ANIMATION_KEY     @"timer.animation.key"
#define VIEWCONTROLLER_TIMER_USERINFO_COMPLETION_KEY    @"timer.completion.key"

@interface RSViewControllerAlertView ()
    
@end


@implementation RSViewControllerAlertView
{
    UIViewController *currentAlertHolder;
}
    
#pragma mark life-cycle methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
    
#pragma mark public method
+(RSViewControllerAlertView*)makeAnAlert:(NSString*)storyboardName
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName
                                                         bundle:[NSBundle mainBundle]];
    
    return (RSViewControllerAlertView*)[storyboard instantiateInitialViewController];
}
    
-(void)showOn:(UIViewController*)alertHolder WithAnimation:(PredefinedAnimation)anim
{
    //call delegate that this view controller is about to show
    if(self.vcavDelegate &&
       [self.vcavDelegate respondsToSelector:(@selector(RSViewControllerAlertViewWillAppear:))])
    {
        [self.vcavDelegate RSViewControllerAlertViewWillAppear:self];
    }
    
    
    currentAlertHolder = alertHolder;
    
    [alertHolder addChildViewController:self];
    [self didMoveToParentViewController:alertHolder];
    
    if([alertHolder isKindOfClass:[UINavigationController class]])
    {
        [super viewWillAppear:YES];
    }
    
    switch(anim)
    {
        case PredefinedAnimation_ShowWithDamping:
        {
            [self showOnWithDamping:alertHolder];
        }
        break;
        case PredefinedAnimation_ShowWithFadeIn:
        {
            [self showOnWithFadeIn:alertHolder];
        }
        break;
        
        case PredefinedAnimation_HideWithDamping:
        case PredefinedAnimation_HideWithFadeOut:
        default:
        {
            NSLog(@"WRONG ANIMATION PARAMTER PASSED");
        }
    }
    
}
    
-(void)hideWithAnimation:(PredefinedAnimation)anim
              onComplete:(RSViewControllerAlertViewCompletionBlok)completion
{
    switch(anim)
    {
        case PredefinedAnimation_HideWithDamping:
        {
            [self hideWithDampingWithCompletion:completion];
        }
        break;
        case PredefinedAnimation_HideWithFadeOut:
        {
            [self hideWithFadeOut:completion];
        }
        break;
        
        case PredefinedAnimation_ShowWithDamping:
        case PredefinedAnimation_ShowWithFadeIn:
        default:
        {
            NSLog(@"WRONG ANIMATION PARAMTER PASSED");
        }
    }
}
    
-(void)hideAutomaticallyAfter:(NSTimeInterval)hidingTime
                withAnimation:(PredefinedAnimation)anim
                   onComplete:(RSViewControllerAlertViewCompletionBlok)completion
{
    [NSTimer scheduledTimerWithTimeInterval:hidingTime
                                     target:self
                                   selector:@selector(hidingTimerExpired:)
                                   userInfo:@{
                                              VIEWCONTROLLER_TIMER_USERINFO_ANIMATION_KEY: [NSNumber numberWithInt:anim],
                                              VIEWCONTROLLER_TIMER_USERINFO_COMPLETION_KEY : completion
                                              }
                                    repeats:NO];
}
    
#pragma mark private factory default animator function
-(void)showOnWithDamping:(UIViewController*)alertHolder
{
    //set initial frame
    CGRect finalFrame = CGRectMake(0,
                                   0,
                                   alertHolder.view.bounds.size.width,
                                   alertHolder.view.bounds.size.height);
    self.view.bounds = finalFrame;
    CGRect initialFrame = CGRectMake(finalFrame.origin.x,
                                     finalFrame.size.height,
                                     finalFrame.size.width,
                                     finalFrame.size.height);
    self.view.frame = initialFrame;
    self.view.backgroundColor = [UIColor clearColor];
    [alertHolder.view addSubview:self.view];
    
    [UIApplication.sharedApplication beginIgnoringInteractionEvents];
    
    [UIView animateWithDuration:1.0 delay:0.1 usingSpringWithDamping:0.4 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         
                         self.view.frame = finalFrame;
                         
                     } completion:^(BOOL finshed){
                         //call delegate that this view controller is shown
                         [UIView animateWithDuration:0.3
                                          animations:^{
                                              self.view.backgroundColor = [UIColor colorWithRed:50.0/255.0
                                                                                          green:50.0/255.0
                                                                                           blue:50.0/255.0
                                                                                          alpha:0.85];
                                          } completion:^(BOOL finished) {
                                              [UIApplication.sharedApplication endIgnoringInteractionEvents];
                                          }];
                         
                         if(self.vcavDelegate &&
                            [self.vcavDelegate respondsToSelector:(@selector(RSViewControllerAlertViewDidAppear:))]
                            )
                         {
                             [self.vcavDelegate RSViewControllerAlertViewDidAppear:self];
                             
                         }
                     }];
}
    
-(void)hideWithDampingWithCompletion:(void(^)(void))completion
{
    
    if(currentAlertHolder)
    {
        //call delegate that this view controller is about to hide
        if(self.vcavDelegate &&
           [self.vcavDelegate respondsToSelector:(@selector(RSViewControllerAlertViewWillDisappear:))]
           )
        {
            [self.vcavDelegate RSViewControllerAlertViewWillDisappear:self];
        }
        
        CGRect animatedFrame = self.view.frame;
        animatedFrame.origin.y = currentAlertHolder.view.frame.size.height;
        
        self.view.backgroundColor = [UIColor clearColor];
        [UIApplication.sharedApplication beginIgnoringInteractionEvents];
        
        [UIView animateWithDuration:1.0 delay:0.1 usingSpringWithDamping:0.4 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
            
            self.view.frame = animatedFrame;
            
        } completion:^(BOOL finished) {
            if(finished)
            {
                [self removeFromParentViewController];
                [self.view removeFromSuperview];
                [self didMoveToParentViewController:nil];
                
                [UIApplication.sharedApplication endIgnoringInteractionEvents];
                
                //call delegate that this view controller is shown
                if(self.vcavDelegate &&
                   [self.vcavDelegate respondsToSelector:(@selector(RSViewControllerAlertViewDiddisappear:))]
                   )
                {
                    [self.vcavDelegate RSViewControllerAlertViewDiddisappear:self];
                }
                
                //  if there is something to do in completion
                //  then execute it, otherwise just ignore
                if(completion)
                {
                    completion();
                }
                
            }
        }];
    }
}
    
-(void)showOnWithFadeIn:(UIViewController*)alertHolder
{
    //set initial frame
    self.view.frame = alertHolder.view.bounds;
    self.view.backgroundColor = [UIColor colorWithRed:50.0/255.0
                                                green:50.0/255.0
                                                 blue:50.0/255.0
                                                alpha:0.85];
    self.view.alpha = 0.0;
    [alertHolder.view addSubview:self.view];
    [UIApplication.sharedApplication beginIgnoringInteractionEvents];
    
    [UIView animateWithDuration:1.0
                     animations:^{
                         
                         self.view.alpha = 1.0;
                         
                     } completion:^(BOOL finshed){
                         //call delegate that this view controller is shown
                         [UIApplication.sharedApplication endIgnoringInteractionEvents];
                         if(self.vcavDelegate &&
                            [self.vcavDelegate respondsToSelector:(@selector(RSViewControllerAlertViewDidAppear:))]
                            )
                         {
                             [self.vcavDelegate RSViewControllerAlertViewDidAppear:self];
                             
                         }
                     }];
}
    
-(void)hideWithFadeOut:(void(^)(void))completion
{
    if(currentAlertHolder)
    {
        //call delegate that this view controller is about to hide
        if(self.vcavDelegate &&
           [self.vcavDelegate respondsToSelector:(@selector(RSViewControllerAlertViewWillDisappear:))]
           )
        {
            [self.vcavDelegate RSViewControllerAlertViewWillDisappear:self];
        }
        
        [UIApplication.sharedApplication beginIgnoringInteractionEvents];
        
        [UIView animateWithDuration:1.0
                         animations:^{
                             
                             self.view.alpha = 0.0;
                             
                         } completion:^(BOOL finished) {
                             if(finished)
                             {
                                 [self removeFromParentViewController];
                                 [self.view removeFromSuperview];
                                 [self didMoveToParentViewController:nil];
                                 
                                 [UIApplication.sharedApplication endIgnoringInteractionEvents];
                                 
                                 //call delegate that this view controller is shown
                                 if(self.vcavDelegate &&
                                    [self.vcavDelegate respondsToSelector:(@selector(RSViewControllerAlertViewDiddisappear:))]
                                    )
                                 {
                                     [self.vcavDelegate RSViewControllerAlertViewDiddisappear:self];
                                 }
                                 
                                 //  if there is something to do in completion
                                 //  then execute it, otherwise just ignore
                                 if(completion)
                                 {
                                     completion();
                                 }
                             }
                         }];
    }
}
    
#pragma mark Timer helper
-(void)hidingTimerExpired:(NSTimer*)timer
{
    if(timer &&
       timer.userInfo)
    {
        
        PredefinedAnimation anim = [timer.userInfo[VIEWCONTROLLER_TIMER_USERINFO_ANIMATION_KEY] intValue];
        RSViewControllerAlertViewCompletionBlok completionBlock = timer.userInfo[VIEWCONTROLLER_TIMER_USERINFO_COMPLETION_KEY];
        
        //  now time to hide
        [self hideWithAnimation:anim onComplete:completionBlock];
        
        //  get rid of the timer
        [timer invalidate];
        timer = nil;
    }
}
    
    @end

