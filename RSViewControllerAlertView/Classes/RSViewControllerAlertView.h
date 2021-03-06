//
//  RSViewControllerAlertView.h
//
//  Created by Ratul Sharker on 1/28/16.
//

#import <UIKit/UIKit.h>
#import <RSViewControllerAlertView/RSViewControllerAlertViewProtocol.h>

/*______________________________________________________
 |                                                      |
 |  Animation enum declaration to be used with the      |
 |  show & the hide functionality of the                |
 |  RSViewControllerAlertView class                     |
 |______________________________________________________|
 */
typedef NS_ENUM (NSUInteger, PredefinedAnimation)
{
    PredefinedAnimation_ShowWithDamping = 1,
    PredefinedAnimation_HideWithDamping,
    
    PredefinedAnimation_ShowWithFadeIn,
    PredefinedAnimation_HideWithFadeOut,
};

/*______________________________________________________
 |                                                      |
 |  Completion block declaration to be used in          |
 |  automatically hideout or showup methods.            |
 |______________________________________________________|
 */
typedef void (^RSViewControllerAlertViewCompletionBlok)(void);


/*______________________________________________________
 |                                                      |
 |  "RSViewcontrollerAlertView" class defination        |
 |______________________________________________________|
 */
@interface RSViewControllerAlertView : UIViewController
    
    /*______________________________________________________________________
     |                                                                      |
     |  "vcavDelegate" stands for "view controller alert view delegate".    |
     |  vcavDelegate is about to store the reference to the object,         |
     |  which is about to implement the "RSViewcontrollerAlertViewDelegate" |
     |  methods.                                                            |
     |______________________________________________________________________|
     */
    @property  (strong) id<RSViewControllerAlertViewDelegate> vcavDelegate;
    
    
    /*______________________________________________________
     |                                                      |
     |  a static class method, which is meant to act as a   |
     |  factory method for the RSViewcontrollerAlertView.   |
     |______________________________________________________|
     */
+(RSViewControllerAlertView*)makeAnAlert:(NSString*)storyboardName;
    
    
    /*______________________________________________________
     |                                                      |
     |  this method is used to show the alert on top of any |
     |  UIViewController, UINavigationController or         |
     |  UITabbarController. Pass the controller as          |
     |  alertController parameter & specify the factory     |
     |  animation so that the alert can roll in with        |
     |  specified animation.                                |
     |______________________________________________________|
     */
-(void)showOn:(UIViewController*)alertHolder WithAnimation:(PredefinedAnimation)anim;
    
    /*______________________________________________________________________________
     |                                                                              |
     |  this method immediately hides the "YourCustomAlertView"                     |
     |  which is subclassed from "RSViewcontrollerAlertView".                       |
     |  hiding animation will be the animation specified by the                     |
     |  anim parameter. pass a completion block, if anything                        |
     |  necessary to do in completion of hiding.                                    |
     |                                                                              |
     |  NB::    you already got "RSViewcontrollerAlertViewDiddisappear" delegate    |
     |          which serves the same purpose just an advantage it's gives a        |
     |          scope for less coding.                                              |
     |______________________________________________________________________________|
     */
-(void)hideWithAnimation:(PredefinedAnimation)anim
              onComplete:(RSViewControllerAlertViewCompletionBlok) completion;
    
    /*__________________________________________________________________________________
     |                                                                                  |
     | this method is just like the "hideWithAnimation: onComplete:", but there is      |
     | a extra benefit of automatically hide the alert after a predefined time.         |
     | after "hidingTime" time passed, it's actually call the "hideWithAnimation..."    |
     |                                                                                  |
     |  NB::    you already got "RSViewcontrollerAlertViewDiddisappear" delegate        |
     |          which serves the same purpose just an advantage it's gives a            |
     |          scope for less coding.                                                  |
     |__________________________________________________________________________________|
     */
-(void)hideAutomaticallyAfter:(NSTimeInterval)hidingTime
                withAnimation:(PredefinedAnimation)anim
                   onComplete:(RSViewControllerAlertViewCompletionBlok)completion;
    @end

