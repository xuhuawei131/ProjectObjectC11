# ProjectObjectC11
        NSString* ns=@"abcd1234";//char* 封装成了字符串 要不然 使用起来就太麻烦了

        //NSString 是一个类 所以必须用指针 由于初始化类比较繁琐 所以使用了@“”语法糖
        
        NSLog(@"src:%@\n",ns);
        
        //NSString 由于是不修改的 所以他的所有函数 都是以stringBy开头 表示产生一个新的字符串
        
        NSString* newNs1=[ns stringByAppendingString:@"efghi123"];//追加 产生一个新的字符串
        
        NSLog(@"src:%@->stringByAppendingString:%@\n",ns,newNs1);
        
        NSString* newNs2=[ns stringByReplacingOccurrencesOfString:@"123" withString:@"xxxXX"];//凡是123的都替换成
        
        //xxx 并产生一个新的字符串
        NSLog(@"src:%@->stringByReplacingOccurrencesOfString:%@\n",ns,newNs2);
        
        
        //结构体不是类 所以他没有＊
        NSRange range1;
        range1.location=0;
        range1.length=3;
        NSString* newNs3=[ns stringByReplacingCharactersInRange:range1 withString:@"123"];
        NSLog(@"src:%@->stringByReplacingCharactersInRange:%@\n",ns,newNs3);
        
        
        NSRange range2;
        range2.location=0;
        range2.length=3;
        //option 是替换的规则 比如从后面开始 或者设置锚点  检索字符串 替换设置好的字符串 用规定的字符串进行替换 并且可以规定他的范围
        NSString* newNs4=[ns stringByReplacingOccurrencesOfString:@"123" withString:@"***" options:0 range:range2];
        NSLog(@"src:%@->stringByReplacingOccurrencesOfString:%@\n",ns,newNs4);
        
        
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
        //NSArray* array1=[NSArray arrayWithObjects:@"item1",@"item2"];
        NSArray *arr3 = [NSArray arrayWithObjects:@"one",@"two",@1, nil,@"three"];//如果数组中有nil
        //那么数组就终止了 就这么大 所以遍历的时候 three 是不会出来的
        NSUInteger length=[arr3 count];//获取数组的长度  NSUInteger 类型 就是long类型
        for(int i=0;i<length;i++){//获取数组中的某一项 使用objectAtIndex 获取 他的返回值是id类型 也是万能类型
            NSLog(@"index:%d,values:%@\n",i,[arr3 objectAtIndex:i]);
        }
        
         NSArray* arr4=@[@"abc",@"def",@"gij"];//使用语法糖的形式 初始化数组
        NSUInteger length2=[arr4 count];//获取数组的长度  NSUInteger 类型 就是long类型
        for(int i=0;i<length2;i++){//获取数组中的某一项 使用objectAtIndex 获取 他的返回值是id类型 也是万能类型
            NSLog(@"index:%d,values2:%@\n",i,arr4[i]);
        }
        
        
        
        //NSMutableArray 是可以再添加的列表
        NSMutableArray* fixArray1=[[NSMutableArray alloc]init];
        [fixArray1 addObject:@"123456"];
        [fixArray1 addObject:@"abcdef"];
        NSUInteger lengthFix=[fixArray1 count];
        for(int i=0;i<lengthFix;i++){//获取数组中的某一项 使用数组的形式 获取 他的返回值是id类型 也是万能类型
            NSLog(@"index:%d,fixArray1:%@\n",i,arr3[i]);
        }
        
       
        //NSArray与NSMutableArray的互相转化
        // NSArray --> NSMutableArray
        NSMutableArray *myMutableArray = [arr4 mutableCopy];
        
        // NSMutableArray --> NSArray
        NSArray *myArray = [myMutableArray copy];
