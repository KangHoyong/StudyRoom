//
//  CandleModel.m
//  LightTheCandle
//
//  Created by 강호용 on 2017. 7. 5..
//  Copyright © 2017년 강호용. All rights reserved.
//

#import "CandleModel.h"

// __strong & __weak 구현부분 제로 포인트 제공 여부 체크
@interface CandleModel(){
    // 멤버변수 선언 , 제로 Weak 제공
    //__weak UIImage *tempWeak;
    
    // 포인터 선언 제로 weak 선언 x
    __unsafe_unretained UIImage *tempWeak;
}
@end




@implementation CandleModel

// 구현부분
// 생성자 및 초기화 void 포인터->id
- (instancetype) init{
    self = [super init];

    if(self){
        // 구현부분
        imageCandleOn = [UIImage imageNamed:@"image/candleon.png"];
        imageCandleOff = [UIImage imageNamed:@"image/candleoff.png"];
        
        __strong UIImage *temp = [[UIImage alloc] init]; // 라이프 사이클 관여함
        //__weak UIImage *tempWeak = temp;
        //  weak 단순참조 객체가 필요해서 포인터를 객체를 가저오는경우 주소는 있는데 내가 원하는객체가 없네 앵글리 포인터 발생
        // 제로 weak
        
        // 로컬변수 생성
        tempWeak = temp;
        
        NSLog(@"%@", tempWeak); // image객체의 주소 log출력 단순 참조
        // 만들어진 아이를 강하게 가지고 있다가 함수의 지역성에 의해서 if문 끝나고 stack pop 되면 메모리 삭제
        // __strong : 객체를 강하게 가지고있는것
    }
    NSLog(@"%@", tempWeak); // if문 끝나고 stack pop 대상지의 주소가 없으므로 NULL처리
    return self;
}

// setter, getter access method 구현부분 
-(UIImage *) imageCandleOn
{
    return imageCandleOn;
}
-(void) setImageCnadleOn:(UIImage *)newImage
{
    imageCandleOn = newImage;
}

-(UIImage *) imageCandleOff
{
    return imageCandleOff;
}
-(void) setImageCandleOff:(UIImage *)newImage
{
    imageCandleOff = newImage;
}

-(BOOL) nowStatus
{
    return nowStatus;
}
-(void) setNowStatus:(BOOL)newStatus
{
    nowStatus = newStatus;
}

- (NSString *) stringNowStatus
{
    NSString *rValue = nil;
    if(nowStatus == FALSE)
    {
        rValue = @"Candle is now off.. " ;
    }
    else
    {
        rValue = @"Candle is now on.. " ;
    }
    
    return rValue;
}

@end
