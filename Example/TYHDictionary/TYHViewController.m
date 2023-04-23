//
//  TYHViewController.m
//  TYHDictionary
//
//  Created by pencilCool on 04/21/2023.
//  Copyright (c) 2023 pencilCool. All rights reserved.
//

#import "TYHViewController.h"
@import TYHDictionary;

@interface TYHViewController ()

@end

@implementation TYHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self cellFor:@"make"];
    [self cellFor:@"myself"];
    [self cellFor:@"great"];
    [self cellFor:@"again"];
    
    [self testHasDefine:@"make"];
    [self testHasDefine:@"makebibi"];
    [self testHasDefine:@"makekkk"];
}


- (void)cellFor:(NSString *)word {
    __weak typeof(self) ws = self;
    [self addCell:word action:^{
        [ws showWord:word];
    }];
}
- (void)showWord:(NSString *)word {
    NSLog(@"word<%@> definition:\n",word);
    NSArray *dvs =   [TYHDictionary definitionForTerm:word];
    [dvs enumerateObjectsUsingBlock:^(NSAttributedString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"   %lu %@",(unsigned long)idx,obj.string);
    }];
    
    NSLog(@"word<%@> long definition:\n",word);
    NSArray *dvs1 =   [TYHDictionary longDefinitionForTerm:word];
    [dvs1 enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"   %lu %@",(unsigned long)idx,obj);
    }];
}


- (void)testHasDefine:(NSString *)term {
    [self addCell:term action:^{
       BOOL r =  [TYHDictionary hasDefinitionForTerm:term];
        NSLog(@" term:%@ %@",term,r?@"has define":@"no define");
    }];
}
@end
