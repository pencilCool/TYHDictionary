//
//  TYHDictionary.m
//  TYHDictionary
//
//  Created by yuhua Tang on 2023/4/21.
//

#import "TYHDictionary.h"
@interface TYHDefinitionValue : NSObject
@property (readonly) NSAttributedString* definition;
@property (readonly) NSString* longDefinition;
@end

@implementation TYHDictionary
static TYHDictionary *sharedDictManager(void) {
    static TYHDictionary *obj;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *className = [NSString stringWithFormat:@"_UI%@%@",@"Dictionary",@"Manager"];
        Class aClass = NSClassFromString(className);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
        obj = [aClass performSelector:@selector(assetManager)];
#pragma clang diagnostic pop
    });
    return obj;
};

static SEL sharedSEL(void) {
    static SEL selector;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *s = [NSString stringWithFormat:@"%@%@",@"_definition",@"ValuesForTerm:"] ;
        selector = NSSelectorFromString(s);
    });
    return selector;
};

static SEL sharedHasDefineSEL(void) {
    static SEL selector;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *s = [NSString stringWithFormat:@"%@%@",@"_hasDefinition",@"ForTerm:"] ;
        selector = NSSelectorFromString(s);
    });
    return selector;
};

+ (NSArray<NSAttributedString *> *)definitionForTerm:(NSString *)term {
    SEL selector = sharedSEL();
    if(![sharedDictManager() respondsToSelector:selector]) {
        return nil;
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    NSArray *definitions = [sharedDictManager() performSelector:selector withObject:term];
#pragma clang diagnostic pop
    NSMutableArray *result = @[].mutableCopy;
    for(TYHDefinitionValue *item in definitions) {
        NSAttributedString *def = [item definition];
        [result addObject:def];
    }
    return result;
}

+ (NSArray<NSString *> *)longDefinitionForTerm:(NSString *)term {
    SEL selector = sharedSEL();
    if(![sharedDictManager() respondsToSelector:selector]) {
        return nil;
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    NSArray *definitions = [sharedDictManager() performSelector:selector withObject:term];
#pragma clang diagnostic pop
    NSMutableArray *result = @[].mutableCopy;
    for(TYHDefinitionValue *item in definitions) {
        NSString *def = [item longDefinition];
        [result addObject:def];
    }
    return result;
}


// bugfix: https://stackoverflow.com/questions/7017281/performselector-may-cause-a-leak-because-its-selector-is-unknown


+ (BOOL)hasDefinitionForTerm:(NSString *)term {
    SEL selector = sharedHasDefineSEL();
    if(![sharedDictManager() respondsToSelector:selector]) {
        return NO;
    }
    IMP imp = [sharedDictManager() methodForSelector:selector];
    BOOL (*func)(id, SEL, NSString *) = (void *)imp;
    BOOL result = func(sharedDictManager(),selector,term);

    return result;
}
@end
