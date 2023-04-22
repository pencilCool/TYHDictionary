//
//  TYHDictionary.h
//  TYHDictionary
//
//  Created by yuhua Tang on 2023/4/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYHDictionary : NSObject
+ (NSArray<NSAttributedString *> *)definitionForTerm:(NSString *)term;
+ (NSArray<NSString *> *)longDefinitionForTerm:(NSString *)term;
@end

NS_ASSUME_NONNULL_END
