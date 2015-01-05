//
//  ViewController.m
//  NSPredicate
//
//  Created by dengbin on 14/12/25.
//  Copyright (c) 2014年 IUAIJIA. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //生成文件路径下文件集合列表
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *defaultPath = [[NSBundle mainBundle] resourcePath];
    NSError *error;
    NSArray *directoryContents = [fileManager contentsOfDirectoryAtPath:defaultPath error:&error];
    
//    NSString *match = @"Info.plist";
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF == %@", match];
//    NSArray *results = [directoryContents filteredArrayUsingPredicate:predicate];
//
    
    
    //2. match里like的用法（类似Sql中的用法）
//    NSString *match = @"I*.plist";
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF like %@", match];
//    NSArray *results = [directoryContents filteredArrayUsingPredicate:predicate];
//    NSLog(@"%@",results);
    
    
    //3. 大小写比较
   // ［c］表示忽略大小写，［d］表示忽略重音，可以在一起使用，如下：
//    NSString *match = @"i*.plist";
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF like[cd] %@", match];
//    NSArray *results = [directoryContents filteredArrayUsingPredicate:predicate];
//
//    NSLog(@"%@",results);

 //   4.使用正则
//    NSString *match = @"\\d{3}\\.txt";  //imagexyz－123.png
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
//    NSArray *results = [directoryContents filteredArrayUsingPredicate:predicate];
//
//        NSLog(@"%@",results);
    
    
    Car *car=[[Car alloc]init];
    car.engine=100;
    car.name=@"Herbie";
    NSPredicate *predicate;
//    predicate = [NSPredicate predicateWithFormat: @"name == 'Herbie'"];
//    BOOL match = [predicate evaluateWithObject: car];
//    NSLog (@"%s", (match) ? "YES" : "NO");
    
    //在整个cars里面循环比较
    predicate = [NSPredicate predicateWithFormat: @"engine > 150"];
    BOOL match = [predicate evaluateWithObject: car];
    NSLog (@"%s", (match) ? "YES" : "NO");

    
    
    
    NSPredicate *predicateTemplate = [NSPredicate predicateWithFormat:@"name == $carName"];
    NSDictionary *varDict;
    varDict = @{@"carName":@"Herbie"};
    
    predicate = [predicateTemplate predicateWithSubstitutionVariables: varDict];
    NSLog(@"SNORGLE: %@", predicate);
    match = [predicate evaluateWithObject: car];
    NSLog (@"%s", (match) ? "YES" : "NO");
    
    
    //谓词字符窜还支持c语言中一些常用的运算符
//    predicate = [NSPredicate predicateWithFormat:
//                 @"(engine.horsepower > 50) AND (engine.horsepower < 200)"];
//    results = [cars filteredArrayUsingPredicate: predicate];
//    NSLog (@"oop %@", results);
    
    
    
    NSArray *arrayFilter = [NSArray arrayWithObjects:@"abc1", @"abc2", nil];
    NSMutableArray *arrayContent = [NSMutableArray arrayWithObjects:@"a1", @"abc1", @"abc4", @"abc2", nil];
    NSPredicate *thePredicate = [NSPredicate predicateWithFormat:@"NOT (SELF in %@)", arrayFilter];
    [arrayContent filterUsingPredicate:thePredicate];
    
    
    NSLog(@"%@",arrayContent);
    
    
 
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
