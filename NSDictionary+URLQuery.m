#import "NSDictionary+URLQuery.h"

@implementation NSDictionary (URLQuery)

+ (NSDictionary *)dictionaryWithURLQuery:(NSString *)query
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	NSArray *parameters = [query componentsSeparatedByString:@"&"];
	for(NSString *parameter in parameters) {
		NSArray *contents = [parameter componentsSeparatedByString:@"="];
		if([contents count] == 2) {
			NSString *key = [contents objectAtIndex:0];
			NSString *value = [contents objectAtIndex:1];
			value = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
			if (key && value) {
				[dict setObject:value forKey:key];
            }
		}
	}
	return [NSDictionary dictionaryWithDictionary:dict];
}

- (NSString *)URLQuery
{
    NSMutableString *string = [NSMutableString string];
    for (NSString *key in [self allKeys]) {
        if ([string length]) {
            [string appendString:@"&"];
        }
        [string appendFormat:@"%@=%@", key, [[self objectForKey:key] description]];
    }
    return string;
}


@end
