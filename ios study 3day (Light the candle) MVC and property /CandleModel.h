//  CandleModel.h
//  LightTheCandle
//  Created by 강호용 on 2017. 7. 5..
//  Copyright © 2017년 강호용. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// MVC 패턴 구현 정의

@interface CandleModel : NSObject
// property 선언하면 알아서 멤버 변수 선언 및 get set 선언됨 모던 런타임에서만 
//{// NSObject 최상의 객체 상속
//    // 외부에서 내부접근이 안됨 get set 추가해야함
//    // 3개의 멤버 변수 선언
//    UIImage *imageCandleOn;
//    UIImage *imageCandleOff;
//    BOOL nowStatus; // 촛불의 상태
//    
//}
// @property 사용 이득 -> synthesize 를 이용하여 get set 자동으로 정의

// nonatomic (단일쓰레드) . atomic -> 맴버 접근안에 뮤텍스 설정 (멤버 접근에만)
// weak , retain , copy , assing -> set를 어떻게 만들가 ? copy를 제외하고는 동일한 코드
// copy set에 대해서 copy 넘어오는 인자에 대해서  copy› 
@property (nonatomic, strong) UIImage *ImageCandlOn;

// 외부에서 접근할수 있도록 엑세스메소드 선언 (get set 추가)
//- (UIImage *) imageCandleOn; // get
//- (void) setImageCnadleOn:(UIImage *)newImage; // set

@property (nonatomic, strong) UIImage *ImageCandlOff;
// 멤버변수 선언 strong -> __string UIImage *_ImageCandlOff;
// retain = strong , assing = strong
// get Name 옵션 getter = name setter = name
// getter만 만들경우 옵션 readonly
//- (UIImage *) imageCandleOff;
//- (void) setImageCandleOff:(UIImage *)newImage;


@property (nonatomic, assign ) BOOL nowStatus;
//- (BOOL) nowStatus;
//- (void) setNowStatus:(BOOL)newStatus;

// NSSstring 반환 메소드
- (NSString *) stringNowStatus; // bool nowStatus 가지고 분기를 해줄 상황에 따라 반환 메소드 생성

@end
