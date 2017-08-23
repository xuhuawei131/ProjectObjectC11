//
//  main.m
//  ProjectObjectC11
//
//  Created by lingdian on 17/8/23.
//  Copyright © 2017年 lingdian. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString* ns=@"abcd";//char* 封装成了字符串 要不然 使用起来就太麻烦了
        //NSString 是一个类 所以必须用指针 由于初始化类比较繁琐 所以使用了@“”语法糖
        NSLog(@"ns:%@\n",ns);
        
        //NSString 初始化的字符串 是不能修改的 如果想修改 可以使用NSMutable
        //initWithString 是以NSString 初始化为NSMutableString类型
        NSMutableString* str=[[NSMutableString alloc]initWithString:@"abcdefg"];//c初始化
        [str appendString:@"hijk"];//追加
        [str appendFormat:@"%d",100];//格式化追加
        NSLog(str);
        
        //NSMutableString 的init方式有很多 下面的是fomat格式化的方式 初始化
        NSMutableString* str2=[[NSMutableString alloc]initWithFormat:@"time is %d:%d:%d",8,8,8];//c初始化
        NSLog(str2);
        
        //NSArray 是固定的数组 初始化完成之后 不能再添加了
        //        NSArray* array1=[NSArray arrayWithObjects:@"item1",@"item2"];
        NSArray *arr3 = [NSArray arrayWithObjects:@"one",@"two",@1, nil,@"three"];//如果数组中有nil
        //那么数组就终止了 就这么大 所以遍历的时候 three 是不会出来的
        
        NSUInteger length=[arr3 count];//获取数组的长度  NSUInteger 类型 就是long类型
        for(int i=0;i<length;i++){//获取数组中的某一项 使用objectAtIndex 获取 他的返回值是id类型 也是万能类型
            NSLog(@"index:%d,values:%@\n",i,[arr3 objectAtIndex:i]);
        }
        
        //NSMutableArray 是可以再添加的列表
        NSMutableArray* fixArray=[[NSMutableArray alloc]init];

        
    }
    return 0;
}
