//
//  HRModel.m
//  HR
//
//  Created by 강호용 on 2017. 7. 15..
//  Copyright © 2017년 강호용. All rights reserved.
//

#import "HRModel.h"

@implementation HRModel

-(instancetype) init{
    
    self = [super init];
    
    if(self)
    {
        _arrayList = [NSMutableArray array]; // 배열 생성
        
        // 입력데이터 레코드 마다 2개의 데이터가 있음

        // NSMutableArray 생성 empty
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"호머",@"name",
                             @"심슨캐릭",@"job", nil];
        [_arrayList addObject:dic];
        // keyValue 값을 밀어넣음 
      
        
        dic = [NSDictionary dictionaryWithObjectsAndKeys:
               @"Mr.빈", @"name" ,
               @"코미디언", @"job",
               nil];
        [_arrayList addObject:dic];
        
        dic = [NSDictionary dictionaryWithObjectsAndKeys:
               @"루시아a", @"name" ,
               @"PD", @"job",
               nil];
        [_arrayList addObject:dic];
        
        dic = [NSDictionary dictionaryWithObjectsAndKeys:
               @"제시카", @"name" ,
               @"가수", @"job",
               nil];
        [_arrayList addObject:dic];
        
    }
    return self;
}

@end
