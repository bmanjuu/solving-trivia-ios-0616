//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    NSLog(@"letters: %@", [self obtainLettersFromString:@"H e l l o there"]);
    
    return YES;
}

-(NSString *)solveTrivia{
    
    NSString *triviaAnswer = @"";
    
    NSDictionary *statesAndCapitals = @{ @"Alabama" : @"Montgomery",
                                         @"Alaska" : @"Juneau",
                                         @"Arizona" : @"Phoenix",
                                         @"Arkansas" : @"Little Rock",
                                         @"California" : @"Sacramento",
                                         @"Colorado" : @"Denver",
                                         @"Connecticut" : @"Hartford",
                                         @"Delaware" : @"Dover",
                                         @"Florida" : @"Tallahassee",
                                         @"Georgia" : @"Atlanta",
                                         @"Hawaii" : @"Honolulu",
                                         @"Idaho" : @"Boise",
                                         @"Illinois" : @"Springfield",
                                         @"Indiana" : @"Indianapolis",
                                         @"Iowa" : @"Des Moines",
                                         @"Kansas" : @"Topeka",
                                         @"Kentucky" : @"Frankfort",
                                         @"Louisiana" : @"Baton Rouge",
                                         @"Maine" : @"Augusta",
                                         @"Maryland" : @"Annapolis",
                                         @"Massachusetts" : @"Boston",
                                         @"Michigan" : @"Lansing",
                                         @"Minnesota" : @"Saint Paul",
                                         @"Mississippi" : @"Jackson",
                                         @"Missouri" : @"Jefferson City",
                                         @"Montana" : @"Helena",
                                         @"Nebraska" : @"Lincoln",
                                         @"Nevada" : @"Carson City",
                                         @"New Hampshire" : @"Concord",
                                         @"New Jersey" : @"Trenton",
                                         @"New Mexico" : @"Santa Fe",
                                         @"New York" : @"Albany",
                                         @"North Carolina" : @"Raleigh",
                                         @"North Dakota" : @"Bismarck",
                                         @"Ohio" : @"Columbus",
                                         @"Oklahoma" : @"Oklahoma City",
                                         @"Oregon" : @"Salem",
                                         @"Pennsylvania" : @"Harrisburg",
                                         @"Rhode Island" : @"Providence",
                                         @"South Carolina" : @"Columbia",
                                         @"South Dakota" : @"Pierre",
                                         @"Tennessee" : @"Nashville",
                                         @"Texas" : @"Austin",
                                         @"Utah" : @"Salt Lake City",
                                         @"Vermont" : @"Montpelier",
                                         @"Virginia" : @"Richmond",
                                         @"Washington" : @"Olympia",
                                         @"West Virginia" : @"Charleston",
                                         @"Wisconsin" : @"Madison",
                                         @"Wyoming" : @"Cheyenne"};
    
    for(NSString *state in statesAndCapitals){
        NSArray *stateLetters = [self obtainLettersFromString:state];
        NSArray *capitalLetters = [self obtainLettersFromString:statesAndCapitals[state]];
        
        BOOL lettersInCommon = [stateLetters firstObjectCommonWithArray:capitalLetters];
        //containsObject method does not work well here and ends up returning Virginia instead of South Dakota. firstObjectCommonWithArray works much better because it checks the values of both arrays and see if they have anything in common. Since we are looking for states and capitals who do not share any letters in common, if the BOOL value of this method returns YES, then it is not the state we are looking for. This process is shown in the following if-statement.
        
        if(!(lettersInCommon)){
            triviaAnswer = state;
        }
        
//        for(NSUInteger i=0; i<[stateLetters count]; i++){
//            if([capitalLetters containsObject:stateLetters[i]]){
//                break; //exit the loop if capitalLetters and stateLetters have letters in common
//            }
//            else {
//                triviaAnswer = state; //if they don't have any letters in common, assign state as triviaAnswer
//            }
//            
//            if(i == [stateLetters count]-1 && [triviaAnswer isEqualToString:state]){
//                return triviaAnswer;
//            //if upon reaching the end of the stateLetters array, triviaAnswers is still equal to the state it is looping through, then trivia answer is that state. this if-statement helps to address the issue where stateLetters[i] may not be in capitalLetters but another stateLetters[x] further down the line is found in capitalLetters. So in the previous else statement where state was assigned to triviaAnswer, we are temporarily making the state the answer until something else proves it wrong (such as another letter within the stateLetters that is found in capitalLetters).
//            }
//        }
    }
    
    return triviaAnswer;
}

-(NSArray *)obtainLettersFromString:(NSString *)string{
    
    NSMutableArray *charactersFromString = [[NSMutableArray alloc] init];
    
    for(NSUInteger i=0; i < [string length]; i++){
        NSString *character = [string substringWithRange:NSMakeRange(i, 1)];
        if(![character isEqualToString:@" "]){
            [charactersFromString addObject:[character lowercaseString]];
        }
    }

    return charactersFromString;
}

@end
