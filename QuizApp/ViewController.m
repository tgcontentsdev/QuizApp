//
//  ViewController.m
//  QuizApp
//
//  Created by tgaiacontentsdev on 2016/01/06.
//  Copyright © 2016年 tgaiacontentsdev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSInteger countNumber;
    NSInteger answer;
    NSInteger qesNumber;
    NSInteger score;
    NSTimer *timer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    answer = 1;
    qesNumber = 1;
    
}

//◯を押した場合

-(IBAction)pushOk:(id)sender{
    countNumber = 1;
    [self chackAns];
    
}

//×を押した場合

-(IBAction)pushNg:(id)sender{
    countNumber = 2;
    [self chackAns];
    
}

//正誤判定（２秒後に次へ）

-(void)chackAns{
    if (countNumber == answer) {
        score++;
        self.backImage.image = [UIImage imageNamed:@"sei.png"];
    }else{
        self.backImage.image = [UIImage imageNamed:@"zan.png"];
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(next:) userInfo:nil repeats:YES];
}

//次の問題へ

-(void)next:(NSTimer*)timer{
    qesNumber++;
    countNumber = 0;
    self.backImage.image = [UIImage imageNamed:@"qes.jpg"];
    switch (qesNumber) {
        case 2:
            self.kazu.text = @"第２問";
            self.quiz.text = @"iPhoneアプリの開発に使われる統合開発環境といえば■codeである。■に入るのはどっち？";
            answer = 2;
            break;
        case 3:
            self.kazu.text = @"第3問";
            self.quiz.text = @"2015年現在日本で一番多い苗字は「鈴木」？";
            answer = 2;
            break;
        case 4:
            self.kazu.text = @"第4問";
            self.quiz.text = @"サザエさんに登場するマスオさんの出身地は大阪？";
            answer = 1;
            break;
        case 5:
            self.kazu.text = @"第5問";
            self.quiz.text = @"このクイズアプリは面白い？";
            answer = 1;
            break;

    
    //結果表示
        default:
            self.backImage.image = [UIImage imageNamed:@"kekka.png"];
            self.kazu.text = @"正解率は";
            self.quiz.text = [NSString stringWithFormat:@"%ld/5",score];
            self.quiz.textAlignment = NSTextAlignmentCenter;
            self.quiz.font = [UIFont fontWithName:@"HiraKakuProN-W6" size:30];
            break;
    }
    [self timerStop];
    
}

//タイマーストップ

-(void)timerStop{
    if (timer != nil) {
        [timer invalidate];
        timer = nil;
        
    }

    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
