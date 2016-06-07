//  FISAppDelegate.h

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (NSString *)solveTrivia;
-(NSArray *)obtainLettersFromString:(NSString *)string; 

@end
