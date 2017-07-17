//
//  AppDelegate.m
//  HR
//
//  Created by 강호용 on 2017. 7. 15..
//  Copyright © 2017년 강호용. All rights reserved.
//

#import "AppDelegate.h"
#include "HRModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


// Model 인스턴스 생성
- (HRModel *) modelHR{
    
    if(_modelHR == nil)
    {
        _modelHR = [[HRModel alloc] init];
        
        // 필요한 시점에 만들기 getter를 통해서 내부적으로 생성되어있는지 확인하고 없으면 생성
        
        // 장점 필요한시점에 가지고 와서 생성
        // 단점 처음 속도 저하의 문제가 발생 !!
    }
    return _modelHR;
}

// Table 소스부분 셋팅
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[self modelHR] arrayList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell
        = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    NSLog(@"qwer");
    // 지금 현재는 스크롤 할때마다 호출된다 속도 저하에 영향을 미침 -> 최적화가 필요함 !!
    //:UITableViewCellStyleValue1 , UITableViewCellStyleValue2, UITableViewCellStyleSubtitle
    /*
    NSString *stringTemp = [NSString stringWithFormat:@"%ld, %ld", [indexPath row] , (long)[indexPath section]];
    // 64bit -> @"%d, %d" -> @"%ld, %ld
    
    [[cell textLabel] setText:stringTemp];
     
     */
    
    /*
    NSDictionary *dic
        = [[[self modelHR] arrayList] objectAtIndex:[indexPath row]];
    간단화 작업 HandCut
    */
    NSDictionary *dic
    = self.modelHR.arrayList[indexPath.row];
    
    // @property 선언시만 . 사용가능 직접 접근이 아닌 getter setter 호출 방식
    // @property(nonatomic, readonly, strong) UILabel getter 만 생성
    //getter .을 이용하여 접근 하는 방식
    //cell.textLabel.text = dic[@"name"];
    //cell.detailTextLabel.text = dic[@"job"];
    
    // getter 방식으로 접근 하는 방법
    [[cell detailTextLabel] setText:[dic objectForKey:@"job"]];
    [[cell textLabel] setText:[dic objectForKey:@"name"]];

    return cell;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // MVC 패턴 인스턴스 생성 
    //_modelHR = [[HRModel alloc] init];
    
    [[self window] makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
