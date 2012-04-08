#import <Foundation/Foundation.h>

@interface NSDictionary (URLQuery)

+ (NSDictionary *)dictionaryWithURLQuery:(NSString *)query;
- (NSString *)URLQuery;

@end
