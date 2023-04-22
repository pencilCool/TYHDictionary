# TYHDictionary

[![CI Status](https://img.shields.io/travis/pencilCool/TYHDictionary.svg?style=flat)](https://travis-ci.org/pencilCool/TYHDictionary)
[![Version](https://img.shields.io/cocoapods/v/TYHDictionary.svg?style=flat)](https://cocoapods.org/pods/TYHDictionary)
[![License](https://img.shields.io/cocoapods/l/TYHDictionary.svg?style=flat)](https://cocoapods.org/pods/TYHDictionary)
[![Platform](https://img.shields.io/cocoapods/p/TYHDictionary.svg?style=flat)](https://cocoapods.org/pods/TYHDictionary)

### API

```
NSArray *dvs =   [TYHDictionary definitionForTerm:@"make"];
[dvs enumerateObjectsUsingBlock:^(NSAttributedString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"   %lu %@",(unsigned long)idx,obj.string);
}];
```

```
0 make | BrE meɪk, AmE meɪk |
A. transitive verb past tense, past participle made
① (create from parts) 制造 zhìzào ‹paper, pottery, vehicle›; 做 zuò ‹food, garment›
▸ to make wine/tea/coffee
酿酒/沏茶/泡咖啡
▸ to make sth from sth;
用某物制造某物
▸ to make sth (out) of sth;
用某物做成某物
▸ to make sth for sb, to make sb sth;
为某人做某物
...

1 make | māk | verb (past and past participle made | mād | ) [with object]
1 form (something) by putting parts together or combining substances; construct; create: my grandmother made a dress for me | the body is made from four pieces of maple | baseball bats are made of ash.
• (make something into) alter something so that it forms or constitutes (something else): buffalo's milk can be made into cheese.
• compose, prepare, or draw up (something written or abstract): she made her will.
• prepare (a dish, drink, or meal) for consumption: she was making lunch for Lucy and Francis | [with two objects] : I'll make us both a cup of tea.
• arrange bedclothes tidily on (a bed) ready for use: after breakfast you'd have until 8:25 to make your bed.
• arrange and light materials for (a fire).
• Electronics complete or close (a circuit).
2 cause (something) to exist or come about; bring about: the drips had made a pool on the floor.
• [with object and complement or infinitive] cause to become or seem: decorative features make brickwork more interesting | the best way to disarm your critics is to make them laugh.
• carry out, perform, or produce (a specified action, movement, or sound): anyone can make a mistake | Unger made a speech of forty minutes | we made a deal.
• communicate or express (an idea, request, or requirement): [with two objects] : make him an offer he can't refuse | I tend to make heavy demands on people.
• archaic enter into a contract of (marriage): a marriage made in heaven.
• [with object and complement] appoint or designate (someone) to a position: he was made a colonel in the Mexican army.
• [with object and complement] represent or cause to appear in a specified way: the sale price and extended
....
```

## Requirements

iOS11+

Cannot be tested on simulator.You must hava a iOS device

## Installation

TYHDictionary is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TYHDictionary'
```

## Author

pencilCool, yhtangcoder@gmail.com

## License

TYHDictionary is available under the MIT license. See the LICENSE file for more info.
