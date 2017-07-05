//
//  AppDelegate.m
//  LightTheCandle
//
//  Created by 강호용 on 2017. 7. 3..
//  Copyright © 2017년 강호용. All rights reserved.
//

#import "AppDelegate.h"
#define SWITCHUPPER 1
#define SWITCHDOWN 2
// class 확장 로컬에 저장가능
@interface AppDelegate ()

@end

// 구현부분 정의 시작 @implementation AppDelegate 끝부분 @end -> 메소드 정의
// 모든 오류는 메시지는 UIApplicationDelegate 정의되어잇음

@implementation AppDelegate
- (IBAction)touchSwitch:(id)sender{
    
    // 구현부분
    //NSLog(@"touched~~~~");
    // 네트워크 통신에서는 사용을 지향함 보안상문제 NScode 에다가 엑세스 코드 찍어보고 삭제할거 안하면 로그로 끌어올수있음
    // 앱단위 공격
    BOOL nowStatus = [sender isOn];
    
    NSInteger t = [sender tag];
    switch (t) {
        case SWITCHUPPER:
            NSLog(@"위에 switch");
            break;
        case SWITCHDOWN:
            NSLog(@"아래 switch");
            break;
        default:
            break;
    }
    if(nowStatus == TRUE)
    {
        [viewImage setImage:[UIImage imageNamed:@"image/candleon.png"]];
        [labelStatus setText:@"촛불이 켜졌습니다 !!! "];
    }
    else
    {
        [viewImage setImage:[UIImage imageNamed:@"image/candleoff.png"]];
        [labelStatus setText:@"촛불이 꺼졌씁니다 !!!!"];
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 앱시작하고 초기화 하고 다음 필요한 초기화 작업수행하는 공간
    // 초기화 작업 완료후 너가 필요한 초기화 작업을 수행
    // Override point for customization after application launch.
    // @ hand cut -> (문자열 객체로 자동변환) setText-> NSString
    // 중복코드
    //[labelStatus setText:@"Candle is now on!"];
    //[switchNow setOn:TRUE];
    //[viewImage setImage:[UIImage imageNamed:@"image/candleon.png"]];
    // UIImage-> 표준 문서보는법 option 키누르고 메서드 클래스
    
    // clean -> command + shift + k
    // 스위치가 꺼저있음
    [switchNow setOn:FALSE];
    [self touchSwitch:switchNow];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // 사용자가 홈버튼 누른경우
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // 백그라운드 5분 지난후 킬링
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // 포그라운 들어올것 실행 될거다
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // 메모리 부족 
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
