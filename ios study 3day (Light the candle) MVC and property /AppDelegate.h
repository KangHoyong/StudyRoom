//  AppDelegate.h
//  LightTheCandle

//  Created by 강호용 on 2017. 7. 3..
//  Copyright © 2017년 강호용. All rights reserved.
//

#import <UIKit/UIKit.h>

// 중복포함 없이 객체를 물리적으로 분리 하자
@class  CandleModel;

/*
 @class 클래스 정의 는 프로젝트 어딘가에 있다 컴파일 상태에서 그냥 넘어가자
 언제 실질적으로 자로형을 정하는가 Runtiem 모델에서 명시한다.
 import 하지 않고 CandleModel 나타냄
 */

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    // 멤버 변수 선언
    IBOutlet UIImageView *viewImage;
    IBOutlet UILabel *labelStatus;
    IBOutlet UISwitch *switchNow;
    
    CandleModel *modelCandle;
    
    
// -> 프로토콜 <UIApplicationDelegate>
// 인터페이스 빌더 인식하게 IBOutlet
// @interface AppDelegate : -> 선언부
}
@property (strong, nonatomic) IBOutlet UIWindow *window;
// 일반 메서드 선언 / 클래스 메서드 + 인자 -> id 선언
- (IBAction)touchSwitch:(id)sender;

@end

