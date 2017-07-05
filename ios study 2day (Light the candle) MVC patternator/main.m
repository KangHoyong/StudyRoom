//
//  main.m
//  LightTheCandle
//
//  Created by 강호용 on 2017. 7. 3..
//  Copyright © 2017년 강호용. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // 기본적인 설정 찾는구역 -> 시작주소
        return UIApplicationMain(argc, argv, nil, nil);
        
        /*
         info.plist -> 시작 주소를 만들어줘야함 
         사용자 인터페이스 부분에보면 잇음
         xib 파일 추가 -> 화면 하나에 대한 기록을 가지고 있음
         empty 파일 생성
         에플리케이션 -> mian -> UIApplicationMain -> info.plist -> 플러스버튼 클릭
         시작주소 Main nib file base name (iPhone) + 파일명 (메모리 로드)
         
         plist -> main
         */
    }
}
