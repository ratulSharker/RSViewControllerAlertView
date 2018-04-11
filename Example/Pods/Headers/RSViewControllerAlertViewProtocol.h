//
//  RSViewControllerAlertViewProtocol.h
//  RSViewControllerAlertView
//
//  Created by ratul sharker on 4/11/18.
//

#ifndef RSViewControllerAlertViewProtocol_h
#define RSViewControllerAlertViewProtocol_h

/*______________________________________________________
 |                                                      |
 |  Forward declaration of the RSViewcontrollerAlertView|
 |  class because we are about to use this class        |
 |  type in the RSViewControllerAlertViewDelegate       |
 |______________________________________________________|
 */
@class RSViewControllerAlertView;


/*______________________________________________________
 |                                                      |
 |  Declaration of the RSViewcontrollerAlertViewDelegate|
 |  ,which can be used for various state change of the  |
 |  subclassed "YourCustomAlertView" from the           |
 |  RSViewcontrollerAlertView. All it's protocol methods|
 |  are optional                                        |
 |______________________________________________________|
 */
@protocol RSViewControllerAlertViewDelegate <NSObject>
@optional
/*__________________________________________________________________________________
 |                                                                                  |
 |  "RSViewcontrollerAlertViewWillAppear:" is meant to called when the subclassed   |
 |  "YourCustomAlertView's" showup animation is about to start. To be specific      |
 |  its called before the animation started. A RSViewcontrollerAlertView object is  |
 |  passed to determine for which RSViewcontrollerAlertView this particular delegate|
 |  is called.                                                                      |
 |__________________________________________________________________________________|
 */
-(void)RSViewControllerAlertViewWillAppear    :(RSViewControllerAlertView*)vcav;

/*__________________________________________________________________________________
 |                                                                                  |
 |  "RSViewcontrollerAlertViewDidAppear:" is meant to called when the subclassed    |
 |  "YourCustomAlertView's" showup animation ended. To be specific its              |
 |  called just after the animation completed. A RSViewcontrollerAlertView object is|
 |  passed to determine for which RSViewcontrollerAlertView this particular delegate|
 |  is called.                                                                      |
 |__________________________________________________________________________________|
 */
-(void)RSViewControllerAlertViewDidAppear     :(RSViewControllerAlertView*)vcav;

/*______________________________________________________________________________________
 |                                                                                      |
 |  "RSViewcontrollerAlertViewWillDisappear:" is meant to called when the subclassed    |
 |  "YourCustomAlertView's" hideout animation about to start. To be specific its        |
 |  called just after the animation completed. A RSViewcontrollerAlertView object is    |
 |  passed to determine for which RSViewcontrollerAlertView this particular delegate    |
 |  is called.                                                                          |
 |______________________________________________________________________________________|
 */
-(void)RSViewControllerAlertViewWillDisappear :(RSViewControllerAlertView*)vcav;

/*______________________________________________________________________________________
 |                                                                                      |
 |  "RSViewcontrollerAlertViewDiddisappear:" is meant to called when the subclassed     |
 |  "YourCustomAlertView's" hideout animation ended. To be specific its                 |
 |  called just after the animation completed. A RSViewcontrollerAlertView object is    |
 |  passed to determine for which RSViewcontrollerAlertView this particular delegate    |
 |  is called.                                                                          |
 |______________________________________________________________________________________|
 */
-(void)RSViewControllerAlertViewDiddisappear  :(RSViewControllerAlertView*)vcav;

@end


#endif /* RSViewControllerAlertViewProtocol_h */
