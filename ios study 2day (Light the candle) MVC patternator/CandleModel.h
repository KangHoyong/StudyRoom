//  CandleModel.h
//  LightTheCandle
//  Created by 강호용 on 2017. 7. 5..
//  Copyright © 2017년 강호용. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// MVC 패턴 구현 정의

@interface CandleModel : NSObject{// NSObject 최상의 객체 상속
    // 외부에서 내부접근이 안됨 get set 추가해야함
    // 3개의 멤버 변수 선언
    UIImage *imageCandleOn;
    UIImage *imageCandleOff;
    BOOL nowStatus; // 촛불의 상태
    
}
// 외부에서 접근할수 있도록 엑세스메소드 선언 (get set 추가)
- (UIImage *) imageCandleOn;
- (void) setImageCnadleOn:(UIImage *)newImage;

- (UIImage *) imageCandleOff;
- (void) setImageCandleOff:(UIImage *)newImage;

- (BOOL) nowStatus;
- (void) setNowStatus:(BOOL)newStatus;

// NSSstring 반환 메소드
- (NSString *) stringNowStatus; // bool nowStatus 가지고 분기를 해줄 상황에 따라 반환 메소드 생성

@end
