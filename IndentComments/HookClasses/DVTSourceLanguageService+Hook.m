//
//  DVTSourceLanguageService+Hook.m
//  IndentComments
//
//  Created by Jobs on 15/12/8.
//  Copyright © 2015年 Jobs. All rights reserved.
//

#import "DVTSourceLanguageService+Hook.h"

@implementation DVTSourceLanguageService (Hook)

+ (void)hook
{
    //[self jr_swizzleMethod:@selector(stringByCommentingString:)
                //withMethod:@selector(hook_stringByCommentingString:)
                     //error:nil];
    //修改样式
    [self jr_swizzleMethod:@selector(stringByTogglingCommentsInLineRange:)
                withMethod:@selector(hook_stringByTogglingCommentsInLineRange:)
                     error:nil];
}


/**
 *  多行代码开始注释
 *
 *  @param lineRange 被选中即将进行注释的代码行 格式类似 {34,3}=>第34行,选中3行
 *
 *  @return
 */
-(NSString *)hook_stringByTogglingCommentsInLineRange:(struct _NSRange)lineRange
{
    //直接套用自带函数的返回值进行修改(不去读取textStorage)
    NSString *commentLines      = [self hook_stringByTogglingCommentsInLineRange:lineRange];
    //获取注释代码,正常情况下为 //或 ## (/***/这种类型的注释会导致获取注释代码失败,这种情况下不进行处理)
    NSString *lineCommentPrefix = [self.lineCommentPrefixes firstObject];
    //单行注释直接弹出
    if(lineCommentPrefix.length==0)
    {
        return commentLines;
    }
    //找出需要注释的行(最后一行需要排除)
    NSMutableArray *codeLine  = [NSMutableArray new];
    for(NSString *tempCode in [commentLines componentsSeparatedByString:@"\n"])
    {
        //最后一行是空字符串,进不了if语句
        if([tempCode hasPrefix:lineCommentPrefix])
        {
            [codeLine addObject:[tempCode substringFromIndex:lineCommentPrefix.length]];
        }
    }
    //这里处理一下取消注释的处理,没有需要注释的代码行时,直接弹出
    if(codeLine.count==0)
    {
        return commentLines;
    }
    //标记一个变量,查询最前面的位置(其他代码与这一行对齐)
    NSInteger location = NSNotFound;
    //理论上进入到这个位置了,每一行代码最前面都会是//开始(不使用IndentComments插件)
    for(NSString *commentingString in codeLine)
    {
        NSRange range = [commentingString rangeOfString:@"[^\\s]" options:NSRegularExpressionSearch];
        if(commentingString.length>0)
        {
            location = MIN(location, range.location);
        }
    }
    //容错排除
    if(location == NSNotFound)
    {
        location = 0;
    }
    //重新整合
    NSMutableString *commentCode =[NSMutableString new];
    for(NSString *commentingString in codeLine)
    {
        NSMutableString *mutableString = [commentingString mutableCopy];
        //上面做过容错了,这里的while循环只是为了让中间空着的代码不会显示异常
        while (location>mutableString.length)
        {
            [mutableString appendString:@" "];
        }
        [mutableString insertString:lineCommentPrefix atIndex:location];
        [commentCode appendString:mutableString];
        [commentCode appendString:@"\n"];
    }
    return commentCode;
}


//- (NSString *)hook_stringByCommentingString:(NSString *)commentingString
//{
//    NSString *lineCommentPrefix = [self.lineCommentPrefixes firstObject];
//    
//    if (lineCommentPrefix.length == 0) {
//    
//         //Use `/* */` block comment circum
//        NSArray *blockCommentCircumfix = [self.blockCommentCircumfixes firstObject];
//        lineCommentPrefix = [blockCommentCircumfix firstObject];
//        
//        NSString *lineCommentSuffix = [blockCommentCircumfix lastObject];
//        if (lineCommentSuffix) {
//            commentingString = [commentingString stringByAppendingString:lineCommentSuffix];
//        }
//    }
//    
//    // Check if the string contains nonwhitespace character
//    NSRange range = [commentingString rangeOfString:@"[^\\s]" options:NSRegularExpressionSearch];
//    if (range.location == NSNotFound) {
//        return commentingString;
//    }
//    
//    NSMutableString *mutableString = [commentingString mutableCopy];
//    [mutableString insertString:lineCommentPrefix atIndex:range.location];
//    return [mutableString copy];
//}

@end
