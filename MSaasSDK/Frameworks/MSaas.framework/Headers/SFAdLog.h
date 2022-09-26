//
//  SFAdLog.h
//  TransferPlatform
//
//  Created by lurich on 2021/12/24.
//

#ifndef SFAdLog_h
#define SFAdLog_h

//是否开启请求数据打印
#define SF_DEBUG_MODE_TYPE      YES
#define SF_DEBUG_MODE_MESSAGE   @"已关闭接口日志打印(SF_DEBUG_MODE_TYPE=NO)"
//是否开启联盟回调打印
#define SF_DEBUG_UNION          YES

#ifdef DEBUG
#define SFLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define SFLog(...)
#endif

#endif /* SFAdLog_h */
