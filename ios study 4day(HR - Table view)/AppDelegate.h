//
//  AppDelegate.h
//  HR
//
//  Created by 강호용 on 2017. 7. 15..
//  Copyright © 2017년 강호용. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HRModel;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource> // 담당자 선언



@property (strong , nonatomic) HRModel *modelHR;
@property (strong, nonatomic) IBOutlet UIWindow *window;


@end

