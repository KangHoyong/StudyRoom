//  AppDelegate.h
//  LightTheCandle

//  Created by 강호용 on 2017. 7. 3..
//  Copyright © 2017년 강호용. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    // 멤버 변수 선언
    IBOutlet UIImageView *viewImage;
    IBOutlet UILabel *labelStatus;
    IBOutlet UISwitch *switchNow;
    
// -> 프로토콜 <UIApplicationDelegate>
// 인터페이스 빌더 인식하게 IBOutlet
// @interface AppDelegate : -> 선언부
}
// 일반 메서드 선언 / 클래스 메서드 + 인자 -> id 선언
- (IBAction)touchSwitch:(id)sender;

@property (strong, nonatomic) IBOutlet UIWindow *window;


@end

